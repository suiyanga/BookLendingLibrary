require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:book) { create(:book) }

  describe 'GET #index' do
    it 'assigns @books and renders the index template' do
      get :index
      expect(assigns(:books)).to include(book)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns @book and renders the show template' do
      get :show, params: { id: book.id }
      expect(assigns(:book)).to eq(book)
      expect(response).to render_template(:show)
    end
  end
end
