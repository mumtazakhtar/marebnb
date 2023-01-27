class Booking < ApplicationRecord
  belongs_to :horse
  belongs_to :user

  validate :date_restrictions

  def date_restrictions
    if from_date.present? && from_date < Date.today
      errors.add(:from_date, "can't be in the past")
    elsif to_date.present? && to_date < Date.today
      errors.add(:to_date, "can't be in the past")
    elsif to_date < from_date
      errors.add(:to_date, "can't be earlier than the from date")
    end
  end

  def initalize(days, price, symbol)
  end

  def days
    days = to_date - from_date
    return 1 + days.to_i
  end

  def price
    price = days * horse.price
    return price.to_i
  end

  def symbol
    case status
    when 'pending'
      "<i class='fa-regular fa-circle-question'></i>".html_safe
    when 'accepted'
      "<i class='fa-regular fa-square-check'></i>".html_safe
    when 'declined'
      "<i class='fa-regular fa-circle-xmark'></i>".html_safe
    end
  end
end
