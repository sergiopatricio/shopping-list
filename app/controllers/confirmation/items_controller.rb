# frozen_string_literal: true

class Confirmation::ItemsController < ApplicationController
  def update
    item.assign_attributes(params.permit(:confirmed, :later))
    item.restore_attributes unless item.save

    if item.saved_change_to_later?
      render turbo_stream: [
        turbo_stream.remove("confirmation-item-#{item.id}"),
        turbo_stream.append("confirmation-#{item.later ? 'later' : 'now'}-items",
                            partial: 'confirmations/item',
                            locals: { item: item })
      ]
    else
      render turbo_stream: turbo_stream.replace("confirmation-item-#{item.id}",
                                                partial: 'confirmations/item',
                                                locals: { item: item })
    end
  end

  private

  def item
    @item ||= current_user.items.find(params[:id])
  end
end
