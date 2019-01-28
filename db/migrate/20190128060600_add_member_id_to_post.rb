class AddMemberIdToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :member_id, :integer
  end
end
