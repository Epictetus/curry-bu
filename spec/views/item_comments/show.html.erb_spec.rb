require 'spec_helper'

describe "item_comments/show" do
  before(:each) do
    @item_comment = assign(:item_comment, stub_model(ItemComment,
      :item => nil,
      :comment => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(//)
  end
end
