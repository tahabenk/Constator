require "application_system_test_case"

class DeclarationsTest < ApplicationSystemTestCase
  setup do
    @declaration = declarations(:one)
  end

  test "visiting the index" do
    visit declarations_url
    assert_selector "h1", text: "Declarations"
  end

  test "creating a Declaration" do
    visit declarations_url
    click_on "New Declaration"

    click_on "Create Declaration"

    assert_text "Declaration was successfully created"
    click_on "Back"
  end

  test "updating a Declaration" do
    visit declarations_url
    click_on "Edit", match: :first

    click_on "Update Declaration"

    assert_text "Declaration was successfully updated"
    click_on "Back"
  end

  test "destroying a Declaration" do
    visit declarations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Declaration was successfully destroyed"
  end
end
