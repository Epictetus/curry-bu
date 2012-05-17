# coding: utf-8
module LoginMacros
  def login_as role
    @user = User.create(
      login_name: "testuser#{User.count}",
      password: "123456",
      password_confirmation: "123456",
    )

    visit new_user_session_path
    fill_in "user_login_name", with: @user.login_name
    fill_in "user_password", with: "123456"
    click_button "ログイン"
  end

  def login_with user
    visit new_user_session_path
    fill_in "user_login_name", with: user.login_name
    fill_in "user_password", with: "123456"
    click_button "ログイン"
  end

  def logout
    click_link "ログアウト" rescue nil
  end
end
