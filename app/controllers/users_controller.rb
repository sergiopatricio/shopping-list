# frozen_string_literal: true

class UsersController < ApplicationController
  def edit
    render :edit, locals: { user: current_user }
  end

  def update
    if current_user.update(params.require(:user).permit(:email))
      bypass_sign_in(current_user)
      redirect_to edit_user_path, notice: 'User details updated.'
    else
      render :edit, locals: { user: current_user }
    end
  end

  def update_password
    password_params = params.require(:user).permit(:current_password, :password, :password_confirmation)
    if current_user.update_with_password(password_params)
      bypass_sign_in(current_user)
      redirect_to edit_user_path, notice: 'User password updated.'
    else
      render :edit, locals: { user: current_user }
    end
  end
end
