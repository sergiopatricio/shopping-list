# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user = User::first()
  end

  def current_account
    @current_account ||= current_user&.account
  end
  helper_method :current_account
end
