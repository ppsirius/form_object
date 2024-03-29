class UserForm
  include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include UserValidations
  include UserProfileValidations

  delegate :login, :email, :to => :user
  delegate :city, :postal_code, :street, :display_name, :to => :user_profile
  
  attr_accessor :weather
  validates :weather, :presence => true

  def user
    @user ||= User.new
  end
  
  def user_profile
    @user_profile ||= user.build_user_profile
  end

  def submit(params)
    self.weather = params[:weather]
    user.attributes = params.slice(:login, :email)
    user_profile.attributes = params.slice(:city, :postal_code, :street, :display_name)
    if valid?
      User.transaction do
        user.save!
        user_profile.save!
      end
      return true
    else
      false
    end
  end

end