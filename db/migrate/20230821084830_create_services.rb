# frozen_string_literal: true

class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :title, null: false
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
