class Horse < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :photo

  validates :name, :age, :breed, :location, :price, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
