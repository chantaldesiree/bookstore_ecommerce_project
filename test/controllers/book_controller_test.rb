require 'test_helper'

class BookControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_index_url
    assert_response :success
  end

  test "should get show" do
    get book_show_url
    assert_response :success
  end

  test "should get search" do
    get book_search_url
    assert_response :success
  end

end