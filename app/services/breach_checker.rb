# app/services/breach_checker.rb
require 'net/http'
require 'uri'
require 'json'

class BreachChecker
  # Constant for the API endpoint URL, frozen to prevent changes.
  API_ENDPOINT = "https://haveibeenpwned.com/api/v3/breachedaccount"

  def initialize(email)
    # Stores the email to be checked and retrieves the API key from environment variables for security.
    @email = email
    @api_key = ENV.fetch('HIBP_KEY')
  end

  def check
    # Creates a URI object with the email properly escaped to prevent injection issues.
    uri = URI("#{API_ENDPOINT}/#{CGI.escape(email)}?truncateResponse=false")
    request = build_request(uri)

    # Perform the HTTP request and handle the response.
    perform_request(uri, request)
  rescue StandardError => e
    # Logs error to server logs if something goes wrong at any point in the HTTP request lifecycle.
    Rails.logger.error("Error during API call: #{e.message}")
    # Returns an empty array to prevent any issues in the calling code.
    []
  end

  private

  attr_reader :email, :api_key  # Private access initialized variables.

  def build_request(uri)
    # Builds the HTTP GET request with the necessary headers including the API key.
    request = Net::HTTP::Get.new(uri)
    request['hibp-api-key'] = api_key
    request
  end

  def perform_request(uri, request)
    # Initiates the HTTP request using Net::HTTP and handles different types of HTTP responses.
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') { |http| http.request(request) }

    case response
    when Net::HTTPSuccess
      # Parses and returns the response body if the request was successful.
      JSON.parse(response.body)
    when Net::HTTPNotFound
      # Returns  empty array if the email was not found in any breach (no breach data).
      []
    else
      # Logs  error for unexpected response types and returns an empty array as default.
      Rails.logger.error("Unexpected response from HIBP API: #{response.body}")
      []
    end
  end
end
