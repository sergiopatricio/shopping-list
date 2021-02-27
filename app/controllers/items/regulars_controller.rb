# frozen_string_literal: true

class Items::RegularsController < ApplicationController
  include GroupOwnership

  def index
    @grouped_items = current_user.groups.includes(:regular_items).order(:position)
  end

  def new
    @item = current_user.regular_items.new(
      group_id: params[:group_id],
      position: (current_user.regular_items.where(group_id: params[:group_id]).maximum(:position) || 0) + 1
    )
    check_group_ownership(@item)
  end

  def create
    @item = current_user.regular_items.new(item_params)
    check_group_ownership(@item)

    if @item.save
      ItemOrderService.new.call(@item)
      redirect_to items_regulars_path(anchor: "item-#{@item.id}")
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :position, :group_id)
  end
end
