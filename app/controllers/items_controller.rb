# frozen_string_literal: true

class ItemsController < ApplicationController
  include GroupOwnership

  def new
    item = current_user.items.new(group_id: params[:group_id])
    check_group_ownership(item)

    item.temporary = true
    render :new, locals: { item: item }
  end

  def create
    item = current_user.items.new(item_params)
    check_group_ownership(item)

    item.position = next_group_id_position(item.group_id)
    item.total = 1 if item.temporary?

    if item.save
      render turbo_stream: turbo_stream.append("shopping-list-group-#{item.group_id}-items",
                                               partial: 'shopping_lists/item',
                                               locals: { item: item })

    else
      render turbo_stream: turbo_stream.update('modal-body-content',
                                               partial: 'items/form',
                                               locals: { item: item }),
             status: :unprocessable_entity
    end
  end

  def edit
    render :edit, locals: { item: item }
  end

  def update
    item.assign_attributes(item_params)
    check_group_ownership(item)

    item.position = next_group_id_position(item.group_id) if item.group_id_changed?
    if item.save
      if request.referer&.match?('/confirmation')
        # from confirmation page
        render turbo_stream: turbo_stream.replace("confirmation-item-#{item.id}",
                                                  partial: 'confirmations/item',
                                                  locals: { item: item })
        return
      end

      if item.saved_change_to_group_id?
        render turbo_stream: [
          turbo_stream.remove("shopping-list-item-#{item.id}"),
          turbo_stream.append("shopping-list-group-#{item.group_id}-items",
                              partial: 'shopping_lists/item',
                              locals: { item: item })
        ]
      else
        render turbo_stream: turbo_stream.replace("shopping-list-item-#{item.id}",
                                                  partial: 'shopping_lists/item',
                                                  locals: { item: item })
      end
    else
      render turbo_stream: turbo_stream.update('modal-body-content',
                                               partial: 'items/form',
                                               locals: { item: item }),
             status: :unprocessable_entity
    end
  end

  def destroy
    item.destroy
    render turbo_stream: turbo_stream.remove_all("#shopping-list-item-#{item.id}, #confirmation-item-#{item.id}")
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

  def item
    @item ||= current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:group_id, :name, :temporary, :url)
  end

  def next_group_id_position(group_id)
    (current_user.items.where(group_id: group_id).maximum(:position) || 0) + 1
  end
end
