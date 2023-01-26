class Booking < ApplicationRecord
  belongs_to :horse
  belongs_to :user

  def initalize(days, price, symbol)
  end

  def days
    days = to_date - from_date
    return days.to_i
  end

  def price
    price = days * horse.price
    return price.to_i
  end

  def symbol
    if status == "pending"
      return "<i class='fa-solid fa-ban'></i>"
    elsif status == "accepted"
      return "<i class='fa-regular fa-square-check'></i>"
    end
  end
end
