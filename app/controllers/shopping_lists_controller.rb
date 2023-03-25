# frozen_string_literal: true

class ShoppingListsController < ApplicationController
  def show
    grouped_items = current_account.groups.includes(:items).order(:position)
    if params[:search].present?
      grouped_items =
        grouped_items
          .references(:items)
          .where('unaccent(items.name) ILIKE unaccent(?)', "%#{params[:search]}%")
    end

    if turbo_frame_request?
      render partial: 'groups', locals: { grouped_items: grouped_items }
    else
      render :show, locals: { grouped_items: grouped_items }
    end
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
