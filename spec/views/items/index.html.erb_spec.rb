require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :task => "MyText",
        :completed => false
      ),
      Item.create!(
        :task => "MyText",
        :completed => false
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
