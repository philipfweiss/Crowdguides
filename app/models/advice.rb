class Advice < ActiveRecord::Base
  belongs_to :guide
  validates :guide_id, presence: true
end
