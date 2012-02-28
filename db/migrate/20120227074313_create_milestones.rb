class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :version_id
      t.string :name
      t.text :description
      t.datetime :due_by
      t.datetime :completed_on

      t.timestamps
    end
  end
end
