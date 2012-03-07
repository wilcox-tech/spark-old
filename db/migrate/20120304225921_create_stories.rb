class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.string :created_by
      t.text :description
      t.string :preconditions
      t.string :postconditions
      t.string :normal_flow
      t.string :alternative_flows
      t.string :exceptions
      t.integer :priority

      t.timestamps
    end
  end
end
