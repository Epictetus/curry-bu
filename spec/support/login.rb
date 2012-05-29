# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

module LoginMacros
  def create_logged_in_user
    user = FactoryGirl.create(:user)
    login(user)
    user
  end

  def login(user)
    login_as user, scope: :user
  end
end
