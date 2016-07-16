class Guide < ActiveRecord::Base
  belongs_to :user
  has_many :advices, dependent: :destroy
  validates :title, presence: true, length: {maximum: 200}
  validates :description, presence: true, length: {maximum: 10000}
end
