class BooksController < ApplicationController
  def top
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end

  def show
  		@book = Book.find(params[:id])
      @new_book = Book.new
      @user = @book.user
  end

  def index
  		@books = Book.all
      @book = Book.new
      @user = @book.user
  end

  def new
  		@book = Book.new
  end

  def create
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

  def edit
  	book = Book.find(params[:id])
  end

  def update
    	@book = Book.find(params[:id])
	if @book.update(book_params)
		flash[:notice] = 'Book was successfully updated.'
		redirect_to book_path(@book.id)
  else
      @book = Book.find(params[:id])
      render :edit
	end
  end

  def destroy
  	    book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
