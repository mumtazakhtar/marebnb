class User < ApplicationRecord
  has_many :horses
  has_many :bookings
  has_many :received_bookings, through: :horses, source: :bookings
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
