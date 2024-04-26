# app/controllers/api_controller.rb
class ApiController < ApplicationController
  def check_breaches
    email = params[:email]
    @breaches = BreachChecker.new(email).check

    if @breaches.empty?
      flash[:notice] = "No breaches found for this email."
    else
      flash[:alert] = "Breaches detected!" # Optionally add this if you want to notify on positive results
    end

    render 'api/check_breaches'
  end
end
