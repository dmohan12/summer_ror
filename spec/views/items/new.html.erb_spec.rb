require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :task => "MyText",
      :completed => false
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "textarea[name=?]", "item[task]"

      assert_select "input[name=?]", "item[completed]"
    end
  end
end
