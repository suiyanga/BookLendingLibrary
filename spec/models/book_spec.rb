# spec/models/book_spec.rb

require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'is valid with valid attributes' do
    book = build(:book)
    expect(book).to be_valid
  end

  it 'is invalid without a title' do
    book = build(:book, title: nil)
    expect(book).not_to be_valid
  end

  it 'is invalid without an ISBN' do
    book = build(:book, isbn: nil)
    expect(book).not_to be_valid
  end
end
