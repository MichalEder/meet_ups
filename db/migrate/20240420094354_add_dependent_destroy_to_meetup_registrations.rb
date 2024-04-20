class AddDependentDestroyToMeetupRegistrations < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :meetup_registrations, :meetups, on_delete: :cascade
  end
end
