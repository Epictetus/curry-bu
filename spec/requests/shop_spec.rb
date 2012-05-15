# coding: utf-8
require 'spec_helper'

describe "Shops" do
  before do
    login_as :user

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
