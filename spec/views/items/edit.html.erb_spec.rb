require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :task => "MyText",
      :completed => false
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "textarea[name=?]", "item[task]"

      assert_select "input[name=?]", "item[completed]"
    end
  end
end
