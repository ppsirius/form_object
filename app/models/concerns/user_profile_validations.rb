require 'active_support/concern'

module UserProfileValidations
  extend ActiveSupport::Concern

  included do

    validates_format_of :postal_code,
                        with: /\d{2}-\d{3}/,
                        message: "should be 12-345"

    


  end
    
  end