class BookingsController < ApplicationController

before_action :authenticate_user!

	def index

	end

	def new
		@book_room = Booking.new
		@meeting_rooms_lists = MeetingRoom.all
		@employees_list = User.all
	end

	def create

		@book_room = Booking.create(params.require(:booking).permit(:meeting_room_id,:starts_at,:ends_at, :agenda, :invitees)
			.merge( user_id: current_user.id,status: false))
		invitees_list = params[:booking][:invitees].reject {|c| c.empty?}
		@book_room.invitees = invitees_list
		if @book_room.save
			flash[:success] = "Meeting room is successfully booked for you!!"
			redirect_to new_booking_path
		else
			if @book_room.errors.any?
				flash[:error] = @book_room.errors.full_messages.to_sentence			
		 	end
		 	redirect_to new_booking_path
		end
	end

	def booked_list
		@booked_room_list = Booking.where(status: false)
	end

end
