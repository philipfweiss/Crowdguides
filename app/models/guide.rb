class Guide < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 200}
  validates :description, presence: true, length: {maximum: 10000}
end
