class ShoppingCarts::ItemsController < ApplicationController
  def update
    item = current_user.items.find(params[:id])
    item.total = params[:total]
    item.restore_attributes unless item.save

    render json: { html: render_to_string(partial: 'shopping_carts/item', locals: { item: item }) }
  end
end
