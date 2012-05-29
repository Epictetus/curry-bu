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

    it { page.should have_content("Listing shops") }
    it { page.should have_content("test shop") }
  end

end
