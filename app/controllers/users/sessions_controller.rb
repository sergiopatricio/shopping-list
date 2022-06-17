# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout 'session'

  def respond_to_on_destroy
    redirect_to new_user_session_path, status: :see_other
  end
end
