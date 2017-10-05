class StoreConfigurationsController < ApplicationController
  before_action :set_store_configuration, only: [:show, :edit, :update, :destroy]

  # GET /store_configurations
  # GET /store_configurations.json
  def index
    @store_configurations = StoreConfiguration.all
  end

  # GET /store_configurations/1
  # GET /store_configurations/1.json
  def show
  end

  # GET /store_configurations/new
  def new
    @store_configuration = StoreConfiguration.new
  end

  # GET /store_configurations/1/edit
  def edit
  end

  # POST /store_configurations
  # POST /store_configurations.json
  def create
    @store_configuration = StoreConfiguration.new(store_configuration_params)

    respond_to do |format|
      if @store_configuration.save
        format.html { redirect_to @store_configuration, notice: 'Store configuration was successfully created.' }
        format.json { render :show, status: :created, location: @store_configuration }
      else
        format.html { render :new }
        format.json { render json: @store_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_configurations/1
  # PATCH/PUT /store_configurations/1.json
  def update
    respond_to do |format|
      if @store_configuration.update(store_configuration_params)
        format.html { redirect_to @store_configuration, notice: 'Store configuration was successfully updated.' }
        format.json { render :show, status: :ok, location: @store_configuration }
      else
        format.html { render :edit }
        format.json { render json: @store_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_configurations/1
  # DELETE /store_configurations/1.json
  def destroy
    @store_configuration.destroy
    respond_to do |format|
      format.html { redirect_to store_configurations_url, notice: 'Store configuration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_configuration
      @store_configuration = StoreConfiguration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_configuration_params
      params.require(:store_configuration).permit(:store_name, :store_desc, :email, :phone, :website, :address, :gstn)
    end
end
