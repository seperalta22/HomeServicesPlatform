# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.timestamps
    end
  end
end
