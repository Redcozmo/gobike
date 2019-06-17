# frozen_string_literal: true

class CreateCitybikes < ActiveRecord::Migration[5.2]
  def change
    create_table :citybikes, &:timestamps
  end
end
