class Booking < ActiveRecord::Base
	
	validates :starts_at, :ends_at, :agenda,  presence: true
	validate :check_for_room_availability, :on => :create
	belongs_to :user
	belongs_to :meeting_room

	def check_for_room_availability
		# binding.pry
		if Booking.exists?(starts_at: self.starts_at,meeting_room_id: self.meeting_room_id)
			errors.add(:base, "Selected Meeting room is not available for the given time intervel.Please choose a different location or time!!")
		end
	end

	def booked_room
		MeetingRoom.where(id: self.meeting_room_id)
	end

end
