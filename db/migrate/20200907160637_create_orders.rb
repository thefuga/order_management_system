# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :control_number, unique: true
      t.string :state, null: false
      t.timestamps
    end
  end
end
