class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end
  #ヒント2 end追加

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
      #ヒント25
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      
      redirect_to user_path(@user), notice: "You have updated user successfully."
      #ヒント15 users_path => user_path
    else
      render "edit"
      #ヒント16 render show => render edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
