class BooksController < ApplicationController

  before_action :authenticate_user!

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
  	@book = Book.new
    @bookf = Book.find(params[:id])
    @user = User.find(@bookf.user_id)
    @book_comment = BookComment.new
    @book_comments = @bookf.book_comments


  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if
      @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
     redirect_to books_path, alert: "不正なアクセスです"
    end
  end

  def update
    @book = Book.find(params[:id])

    if
      @book.update(book_params)
      redirect_to book_path(@book)
      flash[:notice] = "You have updated book successfully."

    else
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
