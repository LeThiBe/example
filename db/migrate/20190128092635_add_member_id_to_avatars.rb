class AddMemberIdToAvatars < ActiveRecord::Migration[5.2]
  def change
    add_column :avatars, :member_id, :integer
  end
end
