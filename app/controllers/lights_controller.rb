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
        @light.fire_state_event(new_state_param) if new_state_param
        format.html { redirect_to @light }
        format.json { render :show, status: :ok, location: @light }
      else
        format.html { render :edit }
        format.json { render json: @light.errors, status: :unprocessable_entity }
      end
    end
  end

  def change
    @light.fire_state_event(color_param)
    redirect_to @light
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
      params.require(:light).permit(:name, :text, :default_red, :default_yellow, :default_green, operators_attributes: [:id, :user_id, :admin, :_destroy])
    end

    def color_param
      params.require(:color)
    end

    def new_state_param
      # This is some hacky ass shit right here. Why can't I use am img as a
      # submit button and pass a value as well?
      @light.state_paths.to_states.each do |state|
        if params.include? "#{state.to_s}.x"
          return state.to_s
        end
      end
      return nil
    end

end
