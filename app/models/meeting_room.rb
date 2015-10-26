class MeetingRoom < ActiveRecord::Base
  validates :name, :location,  presence: true
  has_many :bookings
end
