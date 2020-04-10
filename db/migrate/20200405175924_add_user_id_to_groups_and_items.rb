class AddUserIdToGroupsAndItems < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :groups, :user
    add_belongs_to :items, :user

    user = User.first
    Item::Base.update_all(user_id: user.id)
    Group.update_all(user_id: user.id)
  end
end
