class Items::BaseController < ApplicationController
  include GroupOwnership

  before_action :set_item, only: %i[edit update destroy]

  def edit; end

  def update
    @item.assign_attributes(item_params)
    check_group_ownership(@item)
    if @item.save
      ItemOrderService.new.call(@item)
      redirect_to items_path(@item), notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path(@item), notice: 'Item was successfully destroyed.'
  end

  private

  def set_item
    @item = current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :position, :group_id)
  end

  def items_path(item)
    return items_regulars_path if item.is_a?(Item::Regular)

    # fallback
    root_path
  end
end
