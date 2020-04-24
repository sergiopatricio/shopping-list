class ShoppingListsController < ApplicationController
  before_action :use_controller_javascript

  def show
    @grouped_items = current_user.groups.active.includes(:items).order(:position)
  end

  def destroy
    group_id = params[:group_id]

    temporary_items = current_user.temporary_items
    temporary_items = temporary_items.where(group_id: group_id) if group_id
    temporary_items.destroy_all

    items = current_user.items
    items = items.where(group_id: group_id) if group_id
    items.update_all(total: 0, confirmed: false)

    redirect_to shopping_list_path, notice: 'Shopping list cleared.'
  end
end
