class Booking < ApplicationRecord
  belongs_to :horse
  belongs_to :user

  def initalize(days, price)
  end

  def days
    days = to_date - from_date
    return days.to_i
  end

  def price
    price = days * horse.price
    return price.to_i
  end
end
