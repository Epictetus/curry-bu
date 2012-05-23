require 'spec_helper'

describe "item_comments/edit" do
  before(:each) do
    @item_comment = assign(:item_comment, stub_model(ItemComment,
      :item => nil,
      :comment => "MyText",
      :user => nil
    ))
  end

  it "renders the edit item_comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => item_comments_path(@item_comment), :method => "post" do
      assert_select "input#item_comment_item", :name => "item_comment[item]"
      assert_select "textarea#item_comment_comment", :name => "item_comment[comment]"
      assert_select "input#item_comment_user", :name => "item_comment[user]"
    end
  end
end
