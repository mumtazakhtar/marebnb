class BookingsController < ApplicationController
  before_action :set_horse, only: %i[new create]
  before_action :set_booking, only: %i[edit update]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @bookings = Booking.new(booking_params)
    @bookings.horse = @horse

    if @bookings.save
      # TO REDIRECT BACK TO THE BOOKED HORSE
      redirect_to horse_path(@horse)
      # OR TO REDIRECT BACK TO THE BOOKING DASHBOARD?
      # redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: 'Succesful update'
    else
      render :edit, status: unprocessable_entity
    end
  end

  private

  def set_horse
    @horse = Horse.find(params[:horse_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :date_from, :date_to, :user_id, :horse_id)
  end
end
