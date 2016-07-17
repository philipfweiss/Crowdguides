class Advice < ActiveRecord::Base
  belongs_to :guide
  belongs_to :user
  has_many :tidbits, dependent: :destroy
end