# frozen_string_literal: true

class ItemsController < ApplicationController
  include GroupOwnership

  before_action :set_item, only: %i[edit update destroy]

  def regular
    @grouped_items = current_user.groups.includes(:regular_items).order(:position)
  end

  def new
    item = current_user.items.new(group_id: params[:group_id])
    check_group_ownership(item)

    if request.xhr?
      item.temporary = true
      render json: { html: render_to_string(partial: 'items/form', locals: { item: item, custom: true }) }
    else
      item.position = (current_user.items.regular.where(group_id: params[:group_id]).maximum(:position) || 0) + 1
      @item = item
    end
  end

  def create
    item = current_user.items.new(item_params)
    check_group_ownership(item)

    item.position ||=
      (current_user.items.where(group_id: item.group_id, temporary: item.temporary).maximum(:position) || 0) + 1

    if item.save
      ItemOrderService.new.call(item)

      if request.xhr?
        render json: { html: render_to_string(partial: 'shopping_lists/item', locals: { item: item }) }
      else
        redirect_to regular_items_path(anchor: "item-#{item.id}")
      end
    elsif request.xhr?
      render json: { html: render_to_string(partial: 'items/form', locals: { item: item, custom: true }) },
             status: :bad_request
    else
      @item = item
      render :new
    end
  end

  def edit; end

  def update
    @item.assign_attributes(item_params)
    check_group_ownership(@item)
    if @item.save
      ItemOrderService.new.call(@item)
      redirect_to regular_items_path(anchor: "item-#{@item.id}")
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to regular_items_path, notice: 'Item was successfully destroyed.'
  end

  private

  def set_item
    @item = current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:group_id, :name, :position, :temporary, :total)
  end
end
