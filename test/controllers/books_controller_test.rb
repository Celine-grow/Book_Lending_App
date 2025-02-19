require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one) # Uses fixture from test/fixtures/books.yml
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { title: "New Book", author: "New Author", status: "available", description: "An interesting book" } }

    end
    assert_redirected_to books_url
  end

  test "should not create book with invalid data" do
    assert_no_difference("Book.count") do
      post books_url, params: { book: { title: "", author: "", status: "", description: "" } }

    end
    assert_response :unprocessable_entity
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { title: "Updated Title", description: "Updated description" } }

    assert_redirected_to books_url
    @book.reload
    assert_equal "Updated Title", @book.title
  end

  test "should not update book with invalid data" do
    patch book_url(@book), params: { book: { title: "" } }
    assert_response :unprocessable_entity
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end
    assert_redirected_to books_url
  end
end
