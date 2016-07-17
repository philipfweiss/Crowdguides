class Tidbit < ActiveRecord::Base
  belongs_to :advice
  belongs_to :user
end
