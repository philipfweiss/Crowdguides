class Advice < ActiveRecord::Base
  belongs_to :guide
  has_many :tidbits, dependent: :destroy
end