# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!
  protect_from_forgery

  private

  def current_account
    @current_account ||= current_user&.account
  end
  helper_method :current_account
end
