class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit update destroy]

  def index
    @grouped_items = Group.includes(:items).order(:position)
  end

  def new
    @item = Item.new(
      group_id: params[:group_id],
      position: (Item.where(group_id: params[:group_id]).maximum(:position) || 0) + 1
    )
  end

  def edit; end

  def create
    @item = Item.new(item_params)

    if @item.save
      ItemOrderService.new.call(@item)
      redirect_to items_path, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      ItemOrderService.new.call(@item)
      redirect_to items_path, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'Item was successfully destroyed.'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :position, :group_id)
  end
end
