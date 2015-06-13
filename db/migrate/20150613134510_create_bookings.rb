class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
    	t.references :user, index: true
    	t.references :meeting_room, index: true
      t.timestamp :starts_at
      t.timestamp :ends_at
      t.text       :agenda
      t.text       :invitees, array:true, default: []
      t.boolean    :status

      t.timestamps null: false
    end
  end
end
