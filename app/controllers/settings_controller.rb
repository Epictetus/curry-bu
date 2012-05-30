# coding: utf-8
class SettingsController < ApplicationController
  def mail_edit
    @user = current_user
  end

  def mail_update
    @user = User.find(current_user)
    if @user.update_without_password(params[:user])
      sign_in @user, bypass: true
      flash[:notice] = "メールアドレスの変更を保存しました。"
      redirect_to settings_mail_path
    else
      render action: :mail_edit
    end
  end
end
