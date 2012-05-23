require 'spec_helper'

describe Item do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:shop) }
  end

  describe "Valiadtion" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:ate_at) }
    it { should validate_presence_of(:shop_id) }
    it { should validate_numericality_of(:price).only_integer }
  end

  describe "Scope" do
    it { Item.should respond_to :new_uploads }
  end
end
