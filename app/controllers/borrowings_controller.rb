class BorrowingsController < ApplicationController
  def create
    book = Book.find(params[:book_id])

    if params[:borrower_name].blank?
      redirect_to book_path(book), alert: "Borrower name is required!"
      return
    end

    if book.available?
      book.update!(status: "borrowed")
      BorrowingHistory.create!(
        book: book,
        borrower_name: params[:borrower_name],
        borrowed_at: Time.current
      )
      redirect_to book_path(book), notice: "Book borrowed successfully!"
    else
      redirect_to book_path(book), alert: "This book is already borrowed!"
    end
  end

  def update
    book = Book.find_by(id: params[:book_id])
    
    unless book
      redirect_to books_path, alert: "Book not found."
      return
    end
  
    history = BorrowingHistory.find_by(id: params[:id], book: book, returned_at: nil)
  
    if history
      history.update!(returned_at: Time.current)
  
      
      if book.borrowing_histories.where(returned_at: nil).exists?
        book.update!(status: "borrowed")
      else
        book.update!(status: "available")
      end
  
      redirect_to book_path(book), notice: "Book returned successfully!"
    else
      redirect_to book_path(book), alert: "No active borrow record found."
    end
  end
  
end
