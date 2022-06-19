# frozen_string_literal: true

class ConfirmationsController < ApplicationController
  before_action :use_controller_javascript

  def show
    items = current_user.items.to_buy.includes(:group)
    sort = items_sort
    items = if sort == 'name'
              items.order(:name)
            else
              items.order('groups.position, items.position')
            end

    render :show, locals: { sort: sort, items: items }
  end

  def destroy
    current_user.items.update_all(confirmed: false)
    redirect_to confirmation_path, notice: 'Confirmations cleared.'
  end

  private

  def items_sort
    current_user.save_preference(:confirmation_sort, params[:sort]) if params[:sort].present?
    current_user.preference_for(:confirmation_sort)
  end
end
