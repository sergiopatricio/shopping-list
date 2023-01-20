# frozen_string_literal: true

class ShoppingList::ItemsController < ApplicationController
  def update
    item.total = params[:total]
    item.confirmed = item.later = false if item.total <= 0
    item.restore_attributes unless item.save

    render turbo_stream: turbo_stream.replace("shopping-list-item-#{item.id}",
                                              partial: 'shopping_lists/item',
                                              locals: { item: item })
  end

  private

  def item
    @item ||= current_account.items.find(params[:id])
  end
end
