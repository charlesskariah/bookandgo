class BookingsController < ApplicationController

  before_action :authenticate_user!
  before_action :new,  only: [:index, :upcoming, :todays]

  def index
    @booked_room_list = Booking.where(status: false).order("starts_at DESC").last(100)
  end

  def new
    @book_room = Booking.new
    @meeting_rooms_lists = MeetingRoom.all
  end

  def create
    @book_room = Booking.new(booking_params)
    if @book_room.save
      flash[:success] = "Meeting room is successfully booked for you!!"
    else
      flash[:errors] = @book_room.errors.full_messages.to_sentence
    end
    redirect_to root_path
  end

  def upcoming
    @booked_room_list = Booking.where("starts_at >= ?" ,DateTime.current).order(:starts_at)
    render :index
  end

  def todays
    @booked_room_list = Booking
      .where("starts_at >= ? AND starts_at <= ?", Time.current.beginning_of_day,Time.current.end_of_day)
      .order(:starts_at)
    render :index
  end

  private

  def booking_params
    params.require(:booking)
      .permit(:meeting_room_id,:starts_at,:ends_at, :agenda, :invitees => [])
      .merge( user_id: current_user.id,status: false)
  end
end
