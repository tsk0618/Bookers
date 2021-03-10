class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render("index")
    end  
  end

  def show
    @book = Book.find_by(id:params[:id])
  end

  def edit
    @book = Book.find_by(id:params[:id])
  end

  def update
    @book = Book.find_by(id:params[:id])
    # @book.title = params[:title]
    # @book.body = params[:body]
    if @book.update(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render("books/edit")
    end
  end

  def destroy
    @book = Book.find_by(id:params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path(@book.id)
  end

  private
  def book_params
    # "book"=>{"title"=>"???", "body"=>"???"}
    params.require(:book).permit(:title,:body)
  end
end
