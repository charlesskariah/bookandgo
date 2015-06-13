class CreateMeetingRooms < ActiveRecord::Migration
  def change
    create_table :meeting_rooms do |t|
      t.string :name
      t.string :location
      t.boolean :condition
      
      t.timestamps null: false
    end
  end
end
