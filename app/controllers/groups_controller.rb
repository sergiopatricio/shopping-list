# frozen_string_literal: true

class GroupsController < ApplicationController
  def index
    groups = current_user.groups.order(:position)
    render :index, locals: { groups: groups }
  end

  def new
    render :new, locals: { group: current_user.groups.new }
  end

  def edit
    render :edit, locals: { group: group }
  end

  def create
    group = current_user.groups.new(group_params)
    group.position = (current_user.groups.maximum(:position) || 0) + 1

    if group.save
      redirect_to shopping_list_path(anchor: "group-#{group.id}")
    else
      render :new, locals: { group: group }
    end
  end

  def update
    if group.update(group_params)
      redirect_to shopping_list_path(anchor: "group-#{group.id}")
    else
      render :edit, locals: { group: group }
    end
  end

  def destroy
    group.destroy
    redirect_to shopping_list_path, notice: 'Group was deleted.'
  end

  def sort
    ordered_ids = params[:order]&.split(',') || []
    groups = current_user.groups
    ordered_ids.each_with_index do |id, index|
      groups.where(id: id).update_all(position: index)
    end

    redirect_to shopping_list_path, notice: 'Groups order was updated.'
  end

  def items
    items = group.items.order(:position)
    render :items, locals: { items: items }
  end

  private

  def group
    @group ||= current_user.groups.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
