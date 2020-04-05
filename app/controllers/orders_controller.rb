class OrdersController < ApplicationController
  before_action :use_controller_javascript

  def show
    @items = if params[:sort] == 'name'
               Item::Base.to_buy.order(:name)
             else
               Item::Base.to_buy.joins(:group).order('groups.position, items.type, items.position')
             end
  end

  def destroy
    Item::Base.update_all(confirmed: false)
    redirect_to order_path, notice: 'Confirmations cleared.'
  end

  def confirm_item
    update_confirmation(true)
  end

  def unconfirm_item
    update_confirmation(false)
  end

  private

  def item
    @item ||= Item::Base.find(params[:item_id])
  end

  def update_confirmation(confirmed)
    item.update!(confirmed: confirmed)
    render json: { html: render_to_string(partial: 'orders/item', locals: { item: item }), confirmed: item.confirmed }
  end
end
