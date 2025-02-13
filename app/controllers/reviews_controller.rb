class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def create
      @book = Book.find(params[:book_id])
      @review = @book.reviews.new(review_params)
      @review.user = current_user

      if @review.save
        redirect_to @book, notice: "Review added successfully!"
      else
        redirect_to @book, alert: "Failed to add review."
      end
    end

    private

    def review_params
      params.require(:review).permit(:content)
    end
end
