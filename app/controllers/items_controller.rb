# frozen_string_literal: true

class ItemsController < ApplicationController
  include GroupOwnership

  before_action :set_item, only: %i[edit update destroy]

  def regular
    @grouped_items = current_user.groups.includes(:regular_items).order(:position)
  end

  def new
    if request.xhr?
      item = current_user.items.new(group_id: params[:group_id])
      check_group_ownership(item)
      render json: { html: render_to_string(partial: 'items/new_temporary', locals: { item: item }) }
    else
      @item = current_user.items.new(
        group_id: params[:group_id],
        position: (current_user.items.regular.where(group_id: params[:group_id]).maximum(:position) || 0) + 1
      )
      check_group_ownership(@item)
    end
  end

  def create
    if request.xhr?
      item = current_user.items.new(item_params)
      check_group_ownership(item)
      item.total = 1 # add one unit by default
      item.position = (current_user.items.temporary.where(group_id: item.group_id).maximum(:position) || 0) + 1
      item.temporary = true

      if item.save
        render json: { html: render_to_string(partial: 'shopping_lists/item', locals: { item: item }) }
      else
        render json: { html: render_to_string(partial: 'items/new_temporary', locals: { item: item }) },
               status: :bad_request
      end
    else
      @item = current_user.items.new(item_params)
      check_group_ownership(@item)

      if @item.save
        ItemOrderService.new.call(@item)
        redirect_to regular_items_path(anchor: "item-#{@item.id}")
      else
        render :new
      end
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
    params.require(:item).permit(:name, :position, :group_id)
  end
end
