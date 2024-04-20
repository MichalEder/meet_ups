class CreateMeetups < ActiveRecord::Migration[7.1]
  def change
    create_table :meetups do |t|
      t.string :title, null: false
      t.text :description
      t.string :location
      t.datetime :datetime
      t.integer :organizer_id, null: false

      t.timestamps
    end
    
    add_index :meetups, :organizer_id
  end
end
