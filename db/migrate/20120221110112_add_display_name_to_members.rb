class AddDisplayNameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :display_as, :string
  end
end
