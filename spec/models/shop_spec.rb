# coding: utf-8
require 'spec_helper'

describe Shop do
  describe "Associations" do
    it { should belong_to(:create_user) }
    it { should belong_to(:update_user) }
    it { should have_many(:items) }
  end

  describe "Validation" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:create_user_id) }
    it { should validate_presence_of(:update_user_id) }
  end

  describe "Name" do
    describe "重複していない時" do
      before do
        @shop = FactoryGirl.create(:shop)
      end
      it { @shop.should be_valid }
    end

    describe "重複した時" do
      before do
        @shop = FactoryGirl.create(:shop, name: "curry")
        @shop = FactoryGirl.build(:shop, name: "curry")
      end
      it { @shop.should_not be_valid }
    end

    describe "重複したが削除されている時" do
      before do
        @shop = FactoryGirl.create(:shop, name: "curry")
        @shop.destroy
        @shop = FactoryGirl.build(:shop, name: "curry")
      end
      it { @shop.should be_valid }
    end

  end
end
