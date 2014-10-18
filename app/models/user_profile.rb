class UserProfile < ActiveRecord::Base
  
  belongs_to :user

  include UserProfileValidations
  
end
