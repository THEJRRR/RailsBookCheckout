require 'rails_helper'

RSpec.describe "books/index", :type => :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :author => "Author",
        :title => "Title",
        :status => "Status",
        :isbn => "Isbn",
        :active => false
      ),
      Book.create!(
        :author => "Author",
        :title => "Title",
        :status => "Status",
        :isbn => "Isbn",
        :active => false
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
