class InteractionsController < ApplicationController
  before_action :authenticate_user!  # Ensures user is signed in

  # GET /interactions
  def index
    @interactions = current_user.interactions
    @user = current_user
  end

  def show
    @interaction = Interaction.find(params[:id])
    @user = current_user  # This assumes you have a method like `current_user` that Devise provides
  end

end
