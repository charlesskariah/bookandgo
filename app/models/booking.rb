class Booking < ActiveRecord::Base
  validates :starts_at, :ends_at, presence: true
  validate :check_for_room_availability, :on => :create
  belongs_to :user
  belongs_to :meeting_room

  def check_for_room_availability
    if Booking.exists?(["starts_at < ? AND ends_at > ? AND meeting_room_id = ? ",self.ends_at,self.starts_at,self.meeting_room_id])
      errors.add(:base, "Selected meeting room is not available for the given time interval. Please choose a different location or time!")
    end
  end

  def booked_room
    MeetingRoom.where(id: self.meeting_room_id)
  end

  def invitee_names
    invitee_ids = self.invitees
    User.where(id: invitee_ids).select("name").map(&:name).join(',')
  end
end
