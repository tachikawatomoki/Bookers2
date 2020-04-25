class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
  	@books=Book.all
  	@book = Book.new
  	@user=current_user
  end

  def show
  	@book = Book.new
  	@mybook = Book.find(params[:id])
    @book_comment = BookComment.new
  	@user = @mybook.user
  	@books = Book.all
  end


  def edit
    @book = Book.find(params[:id])
    if @book.user ==current_user
    else 
    redirect_to books_path
  end
end
  def create
   @user=current_user
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
      flash[:succees]="Book was successfully created."
      redirect_to book_path(@book)
   else
  	@books = Book.all
    render :index
   end
  end

  def update
  	@book=Book.find(params[:id])
  	if@book.update(book_params)
  	flash[:succees]="Book was successfully created."
  	redirect_to book_path(@book)
  else
  	flash[:danger] = "error"
  	render :edit
  end
end
  def destroy
		book = Book.find(params[:id])
  	    book.user_id == current_user.id 
        book.destroy
        redirect_to books_path
    end
  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end

