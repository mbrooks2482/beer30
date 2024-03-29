class User < ActiveRecord::Base

  # Associations
  has_many :operators
  has_many :operating_lights, through: :operators, source: :light
  has_many :watchers
  has_many :watching_lights, through: :watchers, source: :light

  def self.from_omniauth(auth)
    # Validate the only omniauth logins are allowed from sparcedge.com
    if auth.info.email.split('@')[1] != 'sparcedge.com'
      redirect_to signin_path, alert: 'You must use an @sparcedge.com for Google Auth login.'
    end
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def name_or_email
    name.nil? ? email : name
  end

end
