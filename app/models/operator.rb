class Operator < ActiveRecord::Base

  # Associations
  belongs_to :light
  belongs_to :user

end
