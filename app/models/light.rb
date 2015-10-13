class Light < ActiveRecord::Base

  ALLOWED = %w[red yellow green]

  extend FriendlyId
  friendly_id :name, use: :finders

  # Associations
  has_many :operators
  has_many :users, through: :operators
  has_many :watchers

  accepts_nested_attributes_for :operators, reject_if: :all_blank, allow_destroy: true

  state_machine :state, initial: :red do
    after_transition any => any do |light, transition|
      light.update_text
      light.watchers.each do |watcher|
        LightMailer.state_change_email(watcher.user.email, light).deliver_later
      end
    end

    event :red do
      transition [:yellow, :green] => :red
    end

    event :yellow do
      transition [:red, :green] => :yellow
    end

    event :green do
      transition [:red, :yellow] => :green
    end

  end

  def watched_by?(user)
    self.watchers.where(user: user).count > 0 ? true : false
  end

  def default_text(color)
    case color
    when 'red'
      return default_red
    when 'yellow'
      return default_yellow
    when 'green'
      return default_green
    end
  end

  def update_text
    begin
      self.text = default_text(self.state) if self.text.blank?
      self.save
    rescue
    end
  end

end
