class ExternalDataController < ApplicationController
  before_action :set_external_datum, only: %i[ show edit update destroy ]

  # GET /external_data or /external_data.json
  def index
    @external_data = ExternalDatum.where(user_id: params[:user_id])
  end

  # GET /external_data/1 or /external_data/1.json
  def show
  end

  # GET /external_data/new
  def new
    @external_datum = ExternalDatum.new
  end

  # GET /external_data/1/edit
  def edit
  end

  # POST /external_data or /external_data.json
  def create
    @external_datum = ExternalDatum.new(external_datum_params)
    @external_datum.user_id = current_user.id
    
    
    respond_to do |format|
      if @external_datum.save
        format.html { redirect_to user_path(current_user.username), notice: "External datum was successfully created." }
        format.json { render :show, status: :created, location: @external_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @external_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /external_data/1 or /external_data/1.json
  def update
    respond_to do |format|
      if @external_datum.update(external_datum_params)
        format.html { redirect_to user_path(current_user.username), notice: "External datum was successfully updated." }
        format.json { render :show, status: :ok, location: @external_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @external_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /external_data/1 or /external_data/1.json
  def destroy
    @external_datum.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user.username), notice: "External datum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_datum
      @external_datum = ExternalDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def external_datum_params
      params.require(:external_datum).permit(:user_id, :ext_username, :ext_email, :organization_id, :main_email, :alerts_count)
    end
end
