class Watcher < ActiveRecord::Base

  # Associations
  belongs_to :light, counter_cache: true
  belongs_to :user, counter_cache: true

end
