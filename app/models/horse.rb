class Horse < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :age, :breed, :location, :price, presence: true
end
