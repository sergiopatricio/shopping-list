# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers

  # before_action :authenticate_user!
  before_action :log_in_with_default_user, unless: :user_signed_in?
  protect_from_forgery

  private

  def log_in_with_default_user
    user = User::first()
    sign_in(user)
  end

  def current_account
    @current_account ||= current_user&.account
  end
  helper_method :current_account
end
