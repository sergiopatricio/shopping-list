# frozen_string_literal: true

class ShoppingListsController < ApplicationController
  def show
    grouped_items = current_account.groups.includes(:items).order(:position)
    render :show, locals: { grouped_items: grouped_items }
  end

  def destroy
    confirmed = params[:confirmed] == 'true'
    group_id = params[:group_id]

    items = current_account.items
    items = items.confirmed if confirmed
    items = items.where(group_id: group_id) if group_id

    items.temporary.destroy_all
    items.update_all(total: 0, confirmed: false)

    redirect_to shopping_list_path, status: :see_other
  end
end
