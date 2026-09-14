# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  before do # Set attributes
    visit new_book_path
    fill_in 'book[title]', with: 'harry potter'
    fill_in 'book[author]', with: 'J. K. Rowling'
    fill_in 'book[price]', with: 10
    fill_in 'book[published_date]', with: Date.new(2004, 10, 19)
  end

  scenario 'valid title' do
    click_on 'Create Book'
    expect(page).to have_content('harry potter')
    expect(page).to have_content('Book was successfully created.')
  end

  scenario 'invalid title' do
    fill_in 'book[title]', with: nil
    click_on 'Create Book'
    expect(page).to have_content('Title can\'t be blank')
  end

  scenario 'valid author' do
    click_on 'Create Book'
    expect(page).to have_content('J. K. Rowling')
    expect(page).to have_content('Book was successfully created.')
  end

  scenario 'invalid author' do
    fill_in 'book[author]', with: nil
    click_on 'Create Book'
    expect(page).to have_content('Author can\'t be blank')
  end

  scenario 'valid price' do
    click_on 'Create Book'
    expect(page).to have_content('10')
    expect(page).to have_content('Book was successfully created.')
  end

  scenario 'invalid price' do
    fill_in 'book[price]', with: nil
    click_on 'Create Book'
    expect(page).to have_content('Price can\'t be blank')
  end

  scenario 'valid published date' do
    click_on 'Create Book'
    expect(page).to have_content(Date.new(2004, 10, 19).to_s)
    expect(page).to have_content('Book was successfully created.')
  end

  scenario 'invalid published date' do
    fill_in 'book[published_date]', with: nil
    click_on 'Create Book'
    expect(page).to have_content('Published Date can\'t be blank')
  end
end
