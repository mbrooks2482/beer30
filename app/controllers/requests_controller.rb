class RequestsController < ApplicationController

  before_action :set_light
  before_action :set_request, only: :destroy

  def create
    parameters = request_params
    parameters[:user_id] = @current_user.to_param
    parameters[:state] = new_state_param
    @request = @light.requests.create(parameters)
    redirect_to @light
  end

  def destroy
    @request.destroy
    redirect_to @light
  end

  def index
    @requests = @light.requests
  end

  private

  def set_light
    @light = Light.find(params[:light_id])
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:text)
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
