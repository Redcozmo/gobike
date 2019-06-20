# frozen_string_literal: true

class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.integer :empty_slots
      t.integer :slots
      t.string :status
      t.integer :free_bikes
      t.string :station_id
      t.float :latitude
      t.float :longitude
      t.string :name
      t.timestamp :update_date

      t.timestamps
    end
  end
end
