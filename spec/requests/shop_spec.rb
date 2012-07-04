# coding: utf-8
require 'spec_helper'

describe "Shops" do
  before do
    create_logged_in_user

    FactoryGirl.create :shop
  end

  describe "Shop list" do
    before do
      visit shops_path
    end

    it { page.should have_content("お店を登録する") }
  end

end
