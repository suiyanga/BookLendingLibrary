class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # Prevent treating "sign_out" as a user ID
    if params[:id] == "sign_out"
      redirect_to new_user_session_path and return
    end

    @user = User.find_by(id: params[:id]) || current_user

    if @user.nil?
      redirect_to root_path, alert: "User not found."
      return
    end

    @borrowings = @user.borrowings.where(returned_at: nil)
  end
end
