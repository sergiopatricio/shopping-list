# frozen_string_literal: true

class Confirmation::ItemsController < ApplicationController
  def update
    item.confirmed = params[:confirmed]
    item.restore_attributes unless item.save

    render turbo_stream: turbo_stream.replace("confirmation-item-#{item.id}",
                                              partial: 'confirmations/item',
                                              locals: { item: item })
  end

  private

  def item
    @item ||= current_user.items.find(params[:id])
  end
end
