class Guide < ActiveRecord::Base
  belongs_to :user
  has_many :advices, dependent: :destroy
  validates :title, presence: true, length: {maximum: 200}
  validates :description, presence: true, length: {maximum: 10000}

  # def self.search(search)
  #   where("title LIKE ?", "%#{search}%")
  #   where("content LIKE ?", "%#{search}%")
  # end
end
