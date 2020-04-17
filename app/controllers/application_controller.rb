class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery

  private

  def use_controller_javascript
    @use_controller_javascript = true
  end
end
