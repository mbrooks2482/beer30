class Light < ActiveRecord::Base

  ALLOWED = %w[red yellow green]

  extend FriendlyId
  friendly_id :name, use: :finders

  before_save :update_text

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
