# frozen_string_literal: true

class ConfirmationsController < ApplicationController
  before_action :save_sort_configuration, only: :show

  def show
    items = current_account.items.to_buy.includes(:group)
    items_for_now = items.where(later: false)
    items_for_later = items.where(later: true)
    sort = current_user.configuration.confirmation_sort

    render :show, locals: {
      sort: sort,
      items_for_now: ordered_items(items_for_now, sort),
      items_for_later: ordered_items(items_for_later, sort)
    }
  end

  def destroy
    if params[:confirmed] == 'true'
      items = current_account.items.confirmed
      items.temporary.destroy_all
      items.update_all(total: 0, confirmed: false, later: false)
    else
      current_account.items.update_all(confirmed: false)
    end

    redirect_to confirmation_path, status: :see_other
  end

  def destroy_later
    current_account.items.update_all(later: false)
    redirect_to confirmation_path, status: :see_other
  end

  private

  def save_sort_configuration
    return if params[:sort].blank?

    # don't raise error on failure
    current_user.configuration.update(confirmation_sort: params[:sort])
  end

  def ordered_items(items, sort)
    if sort == 'name'
      items.order(:name)
    else
      items.order('groups.position, items.position')
    end
  end
end
