class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :login

      t.timestamps
    end
  end
end
