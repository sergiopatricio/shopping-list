# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery

  private

  def current_account
    @current_account ||= current_user&.account
  end
  helper_method :current_account
end
