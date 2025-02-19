class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
    @borrow_history = @book.borrowing_histories.order(borrowed_at: :desc) 
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path, notice: "Book added successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if @book.status == "Borrowed"
      redirect_to books_path, alert: "You cannot edit a book that is currently borrowed."
    end
  end


  def new
    @book = Book.new
  end

  def update
  if @book.status == "Borrowed"
    redirect_to books_path, alert: "You cannot update a book that is currently borrowed."
  else
    if @book.update(book_params)
      redirect_to books_path, notice: "Book updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end
end


  def destroy
    if @book.borrowing_histories.exists?(returned_at: nil)
      redirect_to @book, alert: "Cannot delete a book that is currently borrowed."
    else
      @book.destroy
      redirect_to books_path, notice: "Book deleted successfully!"
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :status)
  end

end
