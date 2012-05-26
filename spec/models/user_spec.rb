require 'spec_helper'

describe User do
  describe "Associations" do
    it { should have_many(:items) }
  end

  describe "Valiadtion" do
    it { should validate_presence_of(:login_name) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
  end
end
