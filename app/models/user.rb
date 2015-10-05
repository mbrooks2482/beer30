class User < ActiveRecord::Base

  def name_or_email
    name.nil? email : name
  end

end
