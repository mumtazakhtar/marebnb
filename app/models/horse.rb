class Horse < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :photo

  validates :name, :age, :breed, :location, :price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_breed_and_location_and_price,
    against: [ :breed, :location, :price ],
    using: {
    tsearch: { prefix: true }
    }
end
