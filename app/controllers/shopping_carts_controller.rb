class ShoppingCartsController < ApplicationController
  before_action :use_controller_javascript

  def show
    @grouped_items = Group.includes(:items).order(:position)
  end

  def destroy
    Item::Base.update_all(total: 0, confirmed: false)
    Item::Temporary.destroy_all
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
    @item ||= Item::Base.find(params[:item_id])
  end

  def update_item_total(increment)
    item.total += increment
    item.restore_attributes unless item.save

    render json: { html: render_to_string(partial: 'shopping_carts/item', locals: { item: item }) }
  end
end
