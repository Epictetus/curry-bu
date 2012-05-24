require 'spec_helper'

describe ItemComment do
  describe "Associations" do
    it { should belong_to(:item) }
    it { should belong_to(:user) }
  end

  describe "Valiadtion" do
    it { should validate_presence_of(:item_id) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:comment) }
  end
end
