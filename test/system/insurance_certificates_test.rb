require "application_system_test_case"

class InsuranceCertificatesTest < ApplicationSystemTestCase
  setup do
    @insurance_certificate = insurance_certificates(:one)
  end

  test "visiting the index" do
    visit insurance_certificates_url
    assert_selector "h1", text: "Insurance Certificates"
  end

  test "creating a Insurance certificate" do
    visit insurance_certificates_url
    click_on "New Insurance Certificate"

    click_on "Create Insurance certificate"

    assert_text "Insurance certificate was successfully created"
    click_on "Back"
  end

  test "updating a Insurance certificate" do
    visit insurance_certificates_url
    click_on "Edit", match: :first

    click_on "Update Insurance certificate"

    assert_text "Insurance certificate was successfully updated"
    click_on "Back"
  end

  test "destroying a Insurance certificate" do
    visit insurance_certificates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Insurance certificate was successfully destroyed"
  end
end
