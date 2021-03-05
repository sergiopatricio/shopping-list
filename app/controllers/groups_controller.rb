# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :set_group, only: %i[edit update destroy]

  def index
    @groups = current_user.groups.order(:position).all
  end

  def new
    @group = current_user.groups.new(position: (current_user.groups.maximum(:position) || 0) + 1)
  end

  def edit; end

  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      GroupOrderService.new.call(@group)
      redirect_to groups_path(anchor: "group-#{@group.id}")
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      GroupOrderService.new.call(@group)
      redirect_to shopping_list_path(anchor: "group-#{@group.id}")
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_back(fallback_location: root_path, notice: 'Group was deleted.')
  end

  def sort
    if request.post?
      ordered_ids = params[:order]&.split(',') || []
      groups = current_user.groups
      ordered_ids.each_with_index do |id, index|
        groups.where(id: id).update_all(position: index)
      end

      redirect_to shopping_list_path, notice: 'Groups order was updated.'
    else
      @groups = current_user.groups.order(:position)
    end
  end

  private

  def set_group
    @group = current_user.groups.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :position)
  end
end
