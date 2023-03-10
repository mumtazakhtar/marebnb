class BookingsController < ApplicationController
  # Also set authenticate_user to require login! TODO!
  before_action :set_horse, only: %i[new create]
  before_action :set_booking, only: %i[edit update]

  def index
    @bookings = current_user.bookings + current_user.received_bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.horse = @horse

    if @booking.save
      redirect_to bookings_path
    else
      render "horses/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # @booking.status = params[:status]
    # if params[:booking]

    if @booking.update(booking_params)
      @booking.update(status: "pending") unless params[:booking][:status]
      redirect_to bookings_path, notice: 'Succesful update'
    else
      render :edit, status: :unprocessable_entity
    end

  end

  private

  def calculate_price
    @days = endDate - beginDate
  end

  def set_horse
    @horse = Horse.find(params[:horse_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :from_date, :to_date, :user_id, :horse_id)
  end
end
