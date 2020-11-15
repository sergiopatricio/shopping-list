# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :use_controller_javascript

  def show
    items = current_user.items.to_buy.includes(:group).references(:groups).merge(Group.active)
    @sort = items_sort
    @items = if @sort == 'name'
               items.order(:name)
             else
               items.order('groups.position, items.type, items.position')
             end
  end

  def destroy
    current_user.items.update_all(confirmed: false)
    redirect_to order_path, notice: 'Confirmations cleared.'
  end

  private

  def items_sort
    current_user.save_preference(:order_sort, params[:sort]) if params[:sort].present?
    current_user.preference_for(:order_sort)
  end
end
