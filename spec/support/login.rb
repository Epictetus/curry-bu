module LoginMacros
  def login_as role
    @user = User.create(
      username: "testuser#{User.count}",
      password: "123456",
      password_confirmation: "123456",
    )

    visit new_user_session_path
    fill_in "user_username", with: @user.username
    fill_in "user_password", with: "123456"
    click_button "Sign in"
  end

  def login_with user
    visit new_user_session_path
    fill_in "user_username", with: user.username
    fill_in "user_password", with: "123456"
    click_button "Sign in"
  end

  def logout
    click_link "Logout" rescue nil
  end
end
