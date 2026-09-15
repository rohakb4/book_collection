# frozen_string_literal: true

# location: spec/unit/unit_spec.rb

require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'harry potter', author: 'J. K. Rowling', price: 10, published_date: Date.new(2004, 10, 19))
  end

  it 'has a valid title' do
    expect(subject.title).to eq('harry potter')
  end

  it 'has an invalid title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  
  it 'has a valid author' do
    expect(subject.author).to eq('J. K. Rowling')
  end

  it 'has an invalid author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it 'has a valid price' do
    expect(subject.price).to eq(10)
  end

  it 'has an invalid price' do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it 'has a valid published date' do
    expect(subject.published_date).to eq(Date.new(2004, 10, 19))
  end

  it 'has an invalid published date' do
    subject.published_date = nil
    expect(subject).not_to be_valid
  end
end
