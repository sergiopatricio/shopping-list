# frozen_string_literal: true

class ConfirmationsController < ApplicationController
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
    if params[:confirmed] == 'true'
      items = current_user.items.confirmed
      items.temporary.destroy_all
      items.update_all(total: 0, confirmed: false)
    else
      current_user.items.update_all(confirmed: false)
    end

    redirect_to confirmation_path, status: :see_other, notice: 'Confirmations cleared.'
  end

  private

  def items_sort
    current_user.save_preference(:confirmation_sort, params[:sort]) if params[:sort].present?
    current_user.preference_for(:confirmation_sort)
  end
end
