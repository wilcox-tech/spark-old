class AddMilestoneColumnsToStory < ActiveRecord::Migration
  def change
    add_column :stories, :due_in, :integer
    add_column :stories, :completed_in, :integer
  end
end
