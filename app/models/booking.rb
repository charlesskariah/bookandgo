class Booking < ActiveRecord::Base
	
validates :starts_at, :ends_at, :agenda  presence: true

	belongs_to :users
	belongs_to :meeting_rooms

end
