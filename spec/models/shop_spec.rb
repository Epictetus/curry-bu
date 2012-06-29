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

  describe "Url" do
    it { FactoryGirl.build(:shop, url: "http://currybu.in").should be_valid }
    it { FactoryGirl.build(:shop, url: "https://currybu.in").should be_valid }
    it { FactoryGirl.build(:shop, url: "fugafuga").should_not be_valid }
  end

  describe :add_tag do
    context 'タグを 1 個つけるとき' do
      before do
        @shop = FactoryGirl.create(:shop)
        @shop.add_tag('hoge')
      end
      it 'タグが 1 個ついていること' do
        @shop.tag_list.should include('hoge')
      end
    end
    context 'タグを追加するとき' do
      before do
        @shop = FactoryGirl.create(:shop)
        @shop.add_tag('hoge')
        @shop.reload
        @shop.add_tag('fuga')
      end
      it 'タグが 2 個ついていること' do
        @shop.tag_list.should include('hoge')
        @shop.tag_list.should include('fuga')
      end
    end
  end

  describe :remove_tag do
    context 'タグを削除するとき' do
      before do
        @shop = FactoryGirl.create(:shop)
        @shop.add_tag('hoge')
        @shop.remove_tag('hoge')
      end
      it 'タグが削除されていること' do
        @shop.tag_list.should be_empty
      end
    end

    context 'タグを 1 つ削除するとき' do
      before do
        @shop = FactoryGirl.create(:shop)
        @shop.add_tag('hoge')
        @shop.reload
        @shop.add_tag('fuga')
        @shop.remove_tag('fuga')
      end
      it 'タグが削除されていること' do
        @shop.tag_list.should include('hoge')
        @shop.tag_list.should_not include('fuga')
      end
    end
  end
end
