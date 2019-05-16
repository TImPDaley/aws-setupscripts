class PasswordResetsController < ApplicationController
  before_action :select_user, only: %i[edit update]
  before_action :valid_user, only: %i[edit update]
  before_action :check_expiration, only: %i[edit update]

  def new; end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:success] = 'Email has been sent to you with password reset instructions'
      redirect_to root_url
    else
      flash.now[:danger] = 'That Email address was not found - are you registered?'
      render 'new'
    end
  end

  def edit; end

  def update
    if params[:user][:password].empty?
      flash.now[:danger] = "Password can't be empty"
      render 'edit'
    elsif @user.update(user_params)
      log_in @user
      flash[:success] = 'Password has been reset.'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  # before filters

  def select_user
    @user = User.find_by(email: params[:email])
  end

  # confirms a valid user.
  def valid_user
    unless @user&.activated? &&
           @user&.authenticated?(:reset, params[:id])
      redirect_to new_password_reset_url
    end
  end

  # Checks expiration of reset token.
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = 'Password reset has expired.'
      redirect_to new_password_reset_url
    end
  end
end