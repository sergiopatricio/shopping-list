# frozen_string_literal: true

class Confirmation::ItemsController < ApplicationController
  def update
    item = current_user.items.find(params[:id])
    item.confirmed = params[:confirmed]
    item.restore_attributes unless item.save

    render json: { html: render_to_string(partial: 'confirmations/item', locals: { item: item }) }
  end
end
