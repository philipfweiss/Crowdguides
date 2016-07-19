class Tidbit < ActiveRecord::Base
  belongs_to :advice
  belongs_to :user
  include Bootsy::Container


  #Add validations for this stuff!
end
