class CreateMeetupRegistrations < ActiveRecord::Migration[7.1]
  def change
    create_table :meetup_registrations do |t|
      t.integer :user_id, null: false
      t.integer :meetup_id, null: false

      t.timestamps
    end
    
    add_index :meetup_registrations, [:user_id, :meetup_id], unique: true
  end
end
