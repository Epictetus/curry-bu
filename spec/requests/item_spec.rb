# coding: utf-8
require 'spec_helper'

describe "Items" do
  before do
    create_logged_in_user

  end

  describe "toggle_like" do

    # FIXME 書き方微妙...
    describe "初回登録時" do
      before do
        item = FactoryGirl.create :item
        visit "/items/#{item.id}/toggle_like.json"
      end

      it "登録されること" do
        page.should have_content('{"status":"create","count":1}')
      end
    end

    describe "再度登録時" do
      before do
        item = FactoryGirl.create :item
        visit "/items/#{item.id}/toggle_like.json"
        visit "/items/#{item.id}/toggle_like.json"
      end

      it "削除されること" do
        page.should have_content('{"status":"destroy","count":0}')
      end
    end

    describe "存在しない投稿" do
      before do
        visit "/items/0/toggle_like.json"
      end

      it "error が返ってくること" do
        page.should have_content('{"status":"error"}')
      end
    end

  end
end
