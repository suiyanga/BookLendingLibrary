require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'is valid with valid attributes' do
    book = Book.new(
      title: 'Harry Potter',
      author: 'J.K. Rowling',
      isbn: '1234567890',    # Add ISBN
      description: 'A magical story about a young wizard.' # Add Description
    )
    expect(book).to be_valid
  end

  it 'is invalid without an ISBN' do
    book = Book.new(
      title: 'Harry Potter',
      author: 'J.K. Rowling',
      description: 'A magical story about a young wizard.'
    )
    expect(book).not_to be_valid
  end

  it 'is invalid without a description' do
    book = Book.new(
      title: 'Harry Potter',
      author: 'J.K. Rowling',
      isbn: '1234567890'
    )
    expect(book).not_to be_valid
  end
end
