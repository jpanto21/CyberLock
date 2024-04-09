# app/controllers/api_controller.rb

class ApiController < ApplicationController
  require 'net/http'
  require 'uri'

  def check_breaches
    email = params[:email]
    api_key = ENV.fetch('HIBP_KEY', nil)
    uri = URI("https://haveibeenpwned.com/api/v3/breachedaccount/#{CGI.escape(email)}?truncateResponse=false")

    request = Net::HTTP::Get.new(uri)
    request['hibp-api-key'] = api_key

    response = Net::HTTP.start(uri.hostname, uri.port,
    use_ssl: uri.scheme == 'https') do |http|
    http.request(request)
    end

    if response.is_a?(Net::HTTPSuccess)
      @breaches = JSON.parse(response.body)
    else
      @breaches = []
      flash[:notice] = "No breaches found for this email."
    end

    render 'api/check_breaches'
  end
end
