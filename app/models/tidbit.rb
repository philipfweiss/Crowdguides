class Tidbit < ActiveRecord::Base
  belongs_to :advice
  belongs_to :user

  #Add validations for this stuff!
end
