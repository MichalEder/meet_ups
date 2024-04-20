class DropOragnizers < ActiveRecord::Migration[7.1]
  def change
    drop_table :organizers
  end
end
