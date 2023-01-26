class HorsesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index home show]
  before_action :set_horse_id, only: %i[show edit update destroy]
  
  def index
    if params[:query].present?
      @horses = Horse.search_by_breed_and_location_and_price(params[:query])
    else
      @horses = Horse.order(created_at: :desc)
    end
    
    @markers = @horses.geocoded.map do |horse|
      {
        lat: horse.latitude,
        lng: horse.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { horse: horse }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
  end

  def new
    @horse = Horse.new
  end

  def create
    @horse = Horse.new(horse_params)
    @horse.user = current_user
    if @horse.save
      redirect_to horse_path(@horse)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @horse.update(horse_params)
      redirect_to horse_path, notice: 'Updated Succesfully'
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @horse.destroy
    redirect_to root_path, notice: 'Deleted succesfully'
  end

  private

  def set_horse_id
    @horse = Horse.find(params[:id])
  end

  def horse_params
    params.require(:horse).permit(:name, :age, :description, :breed, :price, :location, :photo)
  end
end
