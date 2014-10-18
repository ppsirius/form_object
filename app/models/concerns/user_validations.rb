require 'active_support/concern'

module UserValidations
  extend ActiveSupport::Concern

  included do
    validates :login, :presence => true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  end
    
end