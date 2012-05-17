# coding: utf-8
class RegistrationsController < Devise::RegistrationsController
  def update
    params[:user].delete(:login_name)
    super
  end

  protected

  def after_update_path_for(resource)
    flash[:notice] = "アカウントの変更を保存しました。"
    settings_account_path
  end
end
