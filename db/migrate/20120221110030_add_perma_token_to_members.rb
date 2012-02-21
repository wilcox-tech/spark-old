class AddPermaTokenToMembers < ActiveRecord::Migration
  def change
    add_column :members, :perma_token, :string
    add_index  :members, :perma_token
  end
end
