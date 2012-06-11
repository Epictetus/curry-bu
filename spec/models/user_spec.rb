# coding: utf-8
require 'spec_helper'

describe User do
  describe "Associations" do
    it { should have_many(:items) }
    it { should have_many(:likes) }
    it { should have_many(:item_comments) }
  end

  describe "Validation" do
    it { should validate_presence_of(:login_name) }
    it { should validate_presence_of(:password) }

    describe :login_name do
      it { FactoryGirl.build(:user, login_name: "john").should be_valid }
      it { FactoryGirl.build(:user, login_name: "1234").should be_valid }
      it { FactoryGirl.build(:user, login_name: "123@").should_not be_valid }
      it { FactoryGirl.build(:user, login_name: "@123").should_not be_valid }
      it { FactoryGirl.build(:user, login_name: "@$%#").should_not be_valid }
      it { FactoryGirl.build(:user, login_name: "ab c").should_not be_valid }
    end

    describe :mail do
      it { FactoryGirl.build(:user, mail: "hoge@hogefugapiyo.ne.jp").should be_valid }
      it { FactoryGirl.build(:user, mail: "hoge@example.com").should be_valid }
      it { FactoryGirl.build(:user, mail: "john@fuga").should_not be_valid }
      it { FactoryGirl.build(:user, mail: "john").should_not be_valid }
    end

    describe :password do
      describe "新規登録の時" do
        it { FactoryGirl.build(:user).should be_valid }
      end

      describe "新規登録でパスワードが空の時" do
        it { FactoryGirl.build(:user, password: "").should_not be_valid }
      end

      describe "更新でパスワードが空の時" do
        before do
          @user = FactoryGirl.create(:user)
          @user.mail = "new@example.com"
        end
        it { @user.should be_valid }
      end
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
