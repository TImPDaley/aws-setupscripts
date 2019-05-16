class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit destroy purge_file]
  before_action :correct_user, only: %i[edit destroy ]
  before_action :set_user, only: %i[show edit update destroy ]

  def index
    if current_user.admin
      @users = User.order(:lastname)
    else
      redirect_to root_path
    end
  end

  def show
    @user = if current_user.admin
              User.find(params[:id])
            else
              User.find(current_user.id)
            end
  end

  def new
    redirect_to root_path,notice: "Your already logged in ... can't create another account." if logged_in?
    @user = User.new
  end

  def edit
    @user = if current_user.admin
              User.find(params[:id])
            else
              User.find(current_user.id)
            end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        @user.send_activation_email
        format.html do
          redirect_to root_url,
                      notice: 'Please check your email to activate your account.'
        end
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html do
          redirect_to @user, notice: 'User was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was Deleted.' }
      format.json { head :no_content }
    end
  end


  private

    def user_params
      params.require(:user).permit(:password_digest, :firstname, :lastname, :middlename, :email, :cellphonenumber, 
          :address1, :address2, :address3, :city, :state, :zipcode, :remember_digest, :reset_digest, 
          :activation_digest, :admin, :activated, :activated_at, :reset_sent_at)
    end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) || current_user.admin?
  end
  
  def logged_in_user
    return unless !logged_in? 
    flash[:danger] = 'Please log in to change a User!'
    redirect_back(fallback_location: login_path)
  end
  
end
