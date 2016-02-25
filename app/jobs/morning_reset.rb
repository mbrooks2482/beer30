class MorningReset < ActiveJob::Base
  def perform
    Light.first.fire_state_event("red")
  end
end
