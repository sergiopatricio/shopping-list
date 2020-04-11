class ShoppingCartsController < ApplicationController
  before_action :use_controller_javascript

  def show
    @grouped_items = current_user.groups.includes(:items).order(:position)
  end

  def destroy
    group_id = params[:group_id]

    temporary_items = current_user.temporary_items
    temporary_items = temporary_items.where(group_id: group_id) if group_id
    temporary_items.destroy_all

    items = current_user.items
    items = items.where(group_id: group_id) if group_id
    items.update_all(total: 0, confirmed: false)

    redirect_to shopping_cart_path, notice: 'Shopping cart cleared.'
  end

  def add_item
    update_item_total(1)
  end

  def remove_item
    update_item_total(-1)
  end

  private

  def item
    @item ||= current_user.items.find(params[:item_id])
  end

  def update_item_total(increment)
    item.total += increment
    item.restore_attributes unless item.save

    render json: { html: render_to_string(partial: 'shopping_carts/item', locals: { item: item }) }
  end
end
