class SessionsController < ApplicationController
  def new
    flash.now.alert = warden.message if warden.message.present?
  end
  
  def create
    user = warden.authenticate!
    redirect_to user, notice: t('auth.success')
  end
  
  def destroy
    warden.logout
    redirect_to root_url, notice: t('auth.logout')
  end
end
