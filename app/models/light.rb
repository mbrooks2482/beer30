class Light < ActiveRecord::Base

  ALLOWED = %w[red yellow green]

  extend FriendlyId
  friendly_id :name, use: :finders

  before_save :update_text

  # Associations
  has_many :operators
  has_many :users, through: :operators
  has_many :watchers

  accepts_nested_attributes_for :operators, reject_if: :all_blank, allow_destroy: true

  def watched_by?(user)
    self.watchers.where(user: user).count > 0 ? true : false
  end

  private

  def update_text
    begin
      if self.text.blank?
        case self.state
        when 'red'
          self.text = self.default_red
        when 'yellow'
          self.text = self.default_yellow
        when 'green'
          self.text = self.default_green
        end
      end
    rescue
    end
  end

end
