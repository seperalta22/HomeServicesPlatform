# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, limit: 128, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :role # enum: customer, provider, admin

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
