class Items::TemporariesController < ApplicationController
  include GroupOwnership

  def new
    item = current_user.temporary_items.new(group_id: params[:group_id])
    check_group_ownership(item)
    render json: { html: render_to_string(partial: 'items/temporaries/new', locals: { item: item }) }
  end

  def create
    item = current_user.temporary_items.new(item_params)
    check_group_ownership(item)
    item.total = 1 # add one unit by default
    item.position = (current_user.temporary_items.where(group_id: item.group_id).maximum(:position) || 0) + 1

    if item.save
      render json: { html: render_to_string(partial: 'shopping_carts/item', locals: { item: item }) }
    else
      render json: { html: render_to_string(partial: 'items/temporaries/new', locals: { item: item }) },
             status: :bad_request
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :group_id)
  end
end
