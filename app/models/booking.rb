class Booking < ApplicationRecord
  belongs_to :horse
  belongs_to :user
end
