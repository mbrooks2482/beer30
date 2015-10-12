class LightMailer < ApplicationMailer

  def state_change_email(email, light)
    @light = light
    mail(to: email, subject: "#{@light.name} has changed to #{@light.state}!")
  end

end
