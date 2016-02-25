class AfternoonReset < ActiveJob::Base
  def perform
    light = Light.first
    light.fire_state_event('green') if light.state == 'red'
  end
end
