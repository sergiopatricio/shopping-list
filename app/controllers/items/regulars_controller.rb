class Items::RegularsController < ApplicationController
  def index
    @grouped_items = Group.includes(:regular_items).order(:position)
  end

  def new
    @item = Item::Regular.new(
      group_id: params[:group_id],
      position: (Item::Regular.where(group_id: params[:group_id]).maximum(:position) || 0) + 1
    )
  end

  def create
    @item = Item::Regular.new(item_params)

    if @item.save
      ItemOrderService.new.call(@item)
      redirect_to items_regulars_path, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :position, :group_id)
  end
end
