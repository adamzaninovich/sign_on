class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_registration_params)
    if @user.save!
      warden.set_user @user
      redirect_to account_path, notice: t('auth.registration.success')
    else
      # flash.now.alert = t('auth.registration.failure')
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes!(user_update_params)
      redirect_to account_path, notice: t('auth.registration.update.success')
    else
      flash.now.alert = t('auth.registration.update.failure')
      render :edit
    end
  end
  
  def show
    @user = current_user
  end
  
private
  
  def user_registration_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def user_update_params
    allowed = :name, :email, :password, :password_confirmation
    # allowed << :role if current_user.admin?
    params.require(:user).permit(allowed)
  end
  
end
