# spec/controllers/books_controller_spec.rb

require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let!(:book) { create(:book) }

  describe 'GET #index' do
    it 'assigns @books and renders the index template' do
      get :index
      expect(assigns(:books)).to include(book)  # Ensure book is in the @books collection
      expect(response).to render_template(:index)  # Ensure the index template is rendered
    end
  end

  describe 'GET #show' do
    it 'assigns @book and renders the show template' do
      get :show, params: { id: book.id }
      expect(assigns(:book)).to eq(book)  # Ensure the book assigned is the correct one
      expect(response).to render_template(:show)  # Ensure the show template is rendered
    end
  end
end
