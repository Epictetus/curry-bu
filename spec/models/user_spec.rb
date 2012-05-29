# coding: utf-8
require 'spec_helper'

describe User do
  describe "Associations" do
    it { should have_many(:items) }
  end

  describe "Validation" do
    it { should validate_presence_of(:login_name) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }

    describe :login_name do
      it { FactoryGirl.build(:user, login_name: "john").should be_valid }
      it { FactoryGirl.build(:user, login_name: "1234").should be_valid }
      it { FactoryGirl.build(:user, login_name: "123@").should_not be_valid }
      it { FactoryGirl.build(:user, login_name: "@123").should_not be_valid }
      it { FactoryGirl.build(:user, login_name: "@$%#").should_not be_valid }
      it { FactoryGirl.build(:user, login_name: "ab c").should_not be_valid }
    end
  end

  describe "LoginName" do
    describe "重複していない時" do
      before do
        @user = FactoryGirl.create(:user)
      end
      it { @user.should be_valid }
    end

    describe "重複した時" do
      before do
        @user = FactoryGirl.create(:user, login_name: "john")
        @user = FactoryGirl.build(:user, login_name: "john")
      end
      it { @user.should_not be_valid }
    end

    describe "重複したが削除されている時" do
      before do
        @user = FactoryGirl.create(:user, login_name: "john")
        @user.destroy
        @user = FactoryGirl.build(:user, login_name: "john")
      end
      it { @user.should be_valid }
    end

  end
end
