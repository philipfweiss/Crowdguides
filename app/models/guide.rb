class Guide < ActiveRecord::Base
  searchable do
    text :title
  end

  belongs_to :user
  validates :title, presence: true, length: {maximum: 200}
  validates :description, presence: true, length: {maximum: 10000}
end
