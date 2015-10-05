class Light < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :finders

end
