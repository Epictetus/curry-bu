require 'spec_helper'

describe "item_comments/index" do
  before(:each) do
    assign(:item_comments, [
      stub_model(ItemComment,
        :item => nil,
        :comment => "MyText",
        :user => nil
      ),
      stub_model(ItemComment,
        :item => nil,
        :comment => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of item_comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
