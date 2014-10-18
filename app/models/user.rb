class User < ActiveRecord::Base
  
  has_one :user_profile
  
  include UserValidations
  
end
