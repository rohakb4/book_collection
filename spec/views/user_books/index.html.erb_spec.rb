require 'rails_helper'

RSpec.describe "user_books/index", type: :view do
  before(:each) do
    user = User.create!(username: "Test User")

    book = Book.create!(
      title: "Test Book",
      author: "Test Author",
      price: 10.00,
      published_date: Date.new(2025, 1, 1)
    )

    assign(:user_books, [
      UserBook.create!(
        user: user,
        book: book
      ),
      UserBook.create!(
        user: user,
        book: book
      )
    ])
  end

  it "renders a list of user_books" do
    render

    expect(rendered).to match(/Test User/)
    expect(rendered).to match(/Test Book/)
  end
end