require 'rails_helper'

RSpec.describe "user_books/edit", type: :view do
  let(:user) { User.create!(username: "Test User") }
  let(:book) {
    Book.create!(
      title: "Test Book",
      author: "Test Author",
      price: 10.00,
      published_date: Date.new(2025, 1, 1)
    )
  }

  let(:user_book) {
    UserBook.create!(
      user: user,
      book: book
    )
  }

  before(:each) do
    assign(:user_book, user_book)
  end

  it "renders the edit user_book form" do
    render

    assert_select "form[action=?][method=?]", user_book_path(user_book), "post" do
      assert_select "select[name=?]", "user_book[user_id]"
      assert_select "select[name=?]", "user_book[book_id]"
    end
  end
end