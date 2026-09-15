require 'rails_helper'

RSpec.describe "user_books/show", type: :view do
  before(:each) do
    user = User.create!(username: "Test User")

    book = Book.create!(
      title: "Test Book",
      author: "Test Author",
      price: 10.00,
      published_date: Date.new(2025, 1, 1)
    )

    @user_book = UserBook.create!(
      user: user,
      book: book
    )

    assign(:user_book, @user_book)
  end

  it "renders attributes" do
    render

    expect(rendered).to match(/#{@user_book.user_id}/)
    expect(rendered).to match(/#{@user_book.book_id}/)
  end
end