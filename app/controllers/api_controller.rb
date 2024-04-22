class ApiController < ApplicationController
  require 'net/http'
  require 'uri'

  def check_breaches
    email = params[:email]
    api_key = ENV.fetch('HIBP_KEY')
    uri = URI("https://haveibeenpwned.com/api/v3/breachedaccount/#{CGI.escape(email)}?truncateResponse=false")

    request = Net::HTTP::Get.new(uri)
    request['hibp-api-key'] = api_key

    begin
      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') { |http| http.request(request) }

      case response
      when Net::HTTPSuccess
        @breaches = JSON.parse(response.body)
      when Net::HTTPNotFound
        @breaches = []
        flash[:notice] = "No breaches found for this email."
      else
        @breaches = []
        flash[:alert] = "Failed to retrieve breach data."
        Rails.logger.error("Unexpected response from HIBP API: #{response.body}")
      end
    rescue StandardError => e
      @breaches = []
      flash[:alert] = "Error during API call: #{e.message}"
      Rails.logger.error("Error during API call: #{e.message}")
    end

    render 'api/check_breaches'
  end
end
