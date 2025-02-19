require "test_helper"

class BookTest < ActiveSupport::TestCase
  def setup
  @book = Book.new(title: "The Hobbit", author: "J.R.R. Tolkien", status: "available", description: "A fantasy novel")
  end


  test "should be valid with valid attributes" do
    assert @book.valid?
  end

  test "should require a title" do
    @book.title = nil
    assert_not @book.valid?
  end

  test "should require an author" do
    @book.author = nil
    assert_not @book.valid?
  end

  test "should require a status" do
    @book.status = nil
    assert_not @book.valid?
  end
  
  test "should require a description" do
  @book.description = nil
  assert_not @book.valid?
  end

  test "status should only allow 'available' or 'borrowed'" do
    @book.status = "lost"
    assert_not @book.valid?
  end

  test "available? should return true for available books" do
    assert @book.available?
  end

  test "available? should return false for borrowed books" do
    @book.status = "borrowed"
    assert_not @book.available?
  end
end
