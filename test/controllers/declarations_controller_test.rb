require "test_helper"

class DeclarationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @declaration = declarations(:one)
  end

  test "should get index" do
    get declarations_url
    assert_response :success
  end

  test "should get new" do
    get new_declaration_url
    assert_response :success
  end

  test "should create declaration" do
    assert_difference('Declaration.count') do
      post declarations_url, params: { declaration: {  } }
    end

    assert_redirected_to declaration_url(Declaration.last)
  end

  test "should show declaration" do
    get declaration_url(@declaration)
    assert_response :success
  end

  test "should get edit" do
    get edit_declaration_url(@declaration)
    assert_response :success
  end

  test "should update declaration" do
    patch declaration_url(@declaration), params: { declaration: {  } }
    assert_redirected_to declaration_url(@declaration)
  end

  test "should destroy declaration" do
    assert_difference('Declaration.count', -1) do
      delete declaration_url(@declaration)
    end

    assert_redirected_to declarations_url
  end
end
