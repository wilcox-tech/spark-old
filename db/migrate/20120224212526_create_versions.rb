class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :name
      t.string :codename
      t.date :target_release_date
      t.date :actual_release_date
      t.integer :project_id

      t.timestamps
    end
  end
end
