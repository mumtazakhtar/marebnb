class Horse < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :photo

  validates :name, :age, :breed, :location, :price, presence: true
end
