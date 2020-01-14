class ShoppingCartsController < ApplicationController
  def show
    @grouped_items = Group.includes(:items).order(:position)
  end

  def destroy
    Item.update_all(total: 0)
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
    @item ||= Item.find(params[:item_id])
  end

  def update_item_total(increment)
    item.total += increment
    item.restore_attributes unless item.save

    render json: { html: render_to_string(partial: 'shopping_carts/item', locals: { item: item }) }
  end
end
