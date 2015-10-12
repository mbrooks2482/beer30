class LightsController < ApplicationController

  load_and_authorize_resource

  before_action :set_light, only: [:show, :edit, :update, :destroy]

  def index
    @lights = Light.all
    if @current_user
      @operating = @current_user.operating_lights
      @watching = @current_user.watching_lights
    else
      @operating = nil
      @watching = nil
    end
  end

  def show
  end

  def new
    @light = Light.new
  end

  def edit
    @users = User.all
  end

  def create
    @light = Light.new(light_params)

    respond_to do |format|
      if @light.save
        format.html { redirect_to @light, notice: 'Light was successfully created.' }
        format.json { render :show, status: :created, location: @light }
      else
        format.html { render :new }
        format.json { render json: @light.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @light.update(light_params)
        format.html { redirect_to @light }
        format.json { render :show, status: :ok, location: @light }
      else
        format.html { render :edit }
        format.json { render json: @light.errors, status: :unprocessable_entity }
      end
    end
  end

  def change
    if Light::ALLOWED.include? color_param
      @light.state = color_param
      @light.text = ''
    end
    @light.save
    redirect_to light_path(@light)
  end

  def watch
    Watcher.create(user: @current_user, light: @light) unless Watcher.where(user: @current_user, light: @light).count > 0
    redirect_to @light
  end

  def unwatch
    Watcher.where(user: @current_user, light: @light).destroy_all
    redirect_to @light
  end

  def destroy
    @light.destroy
    respond_to do |format|
      format.html { redirect_to lights_url, notice: 'Light was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_light
      @light = Light.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def light_params
      params.require(:light).permit(:name, :state, :text, operators_attributes: [:id, :user_id, :admin, :_destroy])
    end

    def color_param
      params.require(:color)
    end

end
