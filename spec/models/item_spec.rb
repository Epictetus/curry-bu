# coding: utf-8
require 'spec_helper'

describe Item do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:shop) }
    it { should have_many(:item_comments) }
  end

  describe "Validation" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:ate_at) }
    it { should validate_numericality_of(:price).only_integer }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:shop_id) }
  end

  describe "Scope" do
    it { Item.should respond_to :new_uploads }
    it { Item.should respond_to :exclude }
  end

  describe "destroy" do
    before do
      @item = FactoryGirl.create(:item)
      @item.destroy
    end

    it ("deleted_at がセットされていること") { @item.deleted?.should be_true  }
    it "ファイルが削除されていないこと" do
      File.exists?(@item.image.file.file.to_s).should be_true
    end
  end
end
