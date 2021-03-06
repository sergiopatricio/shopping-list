# frozen_string_literal: true

class ItemsController < ApplicationController
  include GroupOwnership

  before_action :set_item, only: %i[edit update destroy]

  def new
    item = current_user.items.new(group_id: params[:group_id])
    check_group_ownership(item)

    item.temporary = true
    render json: { html: render_to_string(partial: 'items/form', locals: { item: item, custom: true }) }
  end

  def create
    item = current_user.items.new(item_params)
    check_group_ownership(item)

    item.position = (current_user.items.where(group_id: item.group_id).maximum(:position) || 0) + 1

    if item.save
      render json: { html: render_to_string(partial: 'shopping_lists/item', locals: { item: item }) }
    else
      render json: { html: render_to_string(partial: 'items/form', locals: { item: item, custom: true }) },
             status: :bad_request
    end
  end

  def edit; end

  def update
    @item.assign_attributes(item_params)
    check_group_ownership(@item)
    if @item.save
      redirect_to shopping_list_path(anchor: "item-#{@item.id}")
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to shopping_list_path, notice: 'Item was deleted.'
  end

  def sort
    ordered_ids = params[:order]&.split(',') || []
    items = current_user.items
    ordered_ids.each_with_index do |id, index|
      items.where(id: id).update_all(position: index)
    end

    redirect_to shopping_list_path, notice: 'Items order was updated.'
  end

  private

  def set_item
    @item = current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:group_id, :name, :temporary, :total)
  end
end
