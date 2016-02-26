class MorningResetJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    light = Light.first
    light.update(text: '')
    light.fire_state_event("red")
  end
end
