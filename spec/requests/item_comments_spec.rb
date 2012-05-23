require 'spec_helper'

describe "ItemComments" do
  describe "GET /item_comments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get item_comments_path
      response.status.should be(200)
    end
  end
end
