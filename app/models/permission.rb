class Permission < ActiveRecord::Base
  serialize :allowed_for
  serialize :denied_for
  
  belongs_to :dash_button
end
