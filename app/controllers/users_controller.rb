class UsersController < ApplicationController
  before_action :set_user

  def edit; end

  def update
    if @user.update(params.require(:user).permit(:email))
      bypass_sign_in(@user)
      redirect_to edit_user_path, notice: 'User details updated.'
    else
      render 'edit'
    end
  end

  def update_password
    if @user.update_with_password(params.require(:user).permit(:current_password, :password, :password_confirmation))
      bypass_sign_in(@user)
      redirect_to edit_user_path, notice: 'User password updated.'
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = current_user
  end
end
