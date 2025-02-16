class BooksController < ApplicationController
  before_action :authenticate_user!, only: [ :borrow, :return ]
  before_action :set_book, only: [ :show, :borrow, :return ]

  def index
    @books = Book.all
  end

  def show
    @reviews = @book.reviews
  end

  def borrow
    if @book.available?
      Borrowing.create!(
        user: current_user,
        book: @book,
        due_date: 2.weeks.from_now
      )
      flash[:notice] = "✅ You have successfully borrowed <strong>#{@book.title}</strong>!"
    else
      flash[:alert] = "⚠️ This book is currently unavailable."
    end
    redirect_to @book
  end

  def return
    borrowing = current_user.borrowings.find_by(book: @book, returned_at: nil)

    if borrowing
      borrowing.update(returned_at: Time.current)
      flash[:notice] = "📖 <strong>#{@book.title}</strong> returned successfully!"
    else
      flash[:alert] = "⚠️ You have not borrowed this book."
    end
    redirect_to user_path(current_user)
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
    unless @book
      flash[:alert] = "⚠️ Book not found."
      redirect_to books_path and return
    end
  end
end
