require 'spec_helper'

describe Shop do
  describe "Associations" do
    it { should belong_to(:create_user) }
    it { should belong_to(:update_user) }
    it { should have_many(:items) }
  end

  describe "Valiadtion" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:create_user_id) }
    it { should validate_presence_of(:update_user_id) }
  end
end
