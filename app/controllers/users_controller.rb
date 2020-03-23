class UsersController < ApplicationController
  def index
      @book = Book.new
      @users = User.all
      @user = current_user
  end

  def new
  	@user = User.new
    @book = Book.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      flash[:notice] = 'Plofile was successfully createed.'
  		redirect_to admin_user_url(@user)
  	else
  		render :new
  	end

    @book = Book.new(book_params)
       @book.user_id = current_user.id
    if @book.save
        flash[:notice] = 'Book was successfully created.'
        redirect_to book_path(@book.id)
    else
        @books = Book.all
        render :index
    end
  end

  def show
    @book = Book.new
    @user = current_user
    # @books = Book.find_by(id: params[:id])
    # @user = User.find_by(@book.user_id)
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to user_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = 'Plofile was successfully updated.'
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image, :introduction)
  end
end
