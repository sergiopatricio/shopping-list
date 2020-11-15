# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :use_controller_javascript

  def show
    items = current_user.items.to_buy.includes(:group).references(:groups).merge(Group.active)
    @items = if params[:sort] == 'name'
               items.order(:name)
             else
               items.order('groups.position, items.type, items.position')
             end
  end

  def destroy
    current_user.items.update_all(confirmed: false)
    redirect_to order_path, notice: 'Confirmations cleared.'
  end
end
