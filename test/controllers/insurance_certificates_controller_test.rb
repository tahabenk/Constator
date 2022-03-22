require "test_helper"

class InsuranceCertificatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insurance_certificate = insurance_certificates(:one)
  end

  test "should get index" do
    get insurance_certificates_url
    assert_response :success
  end

  test "should get new" do
    get new_insurance_certificate_url
    assert_response :success
  end

  test "should create insurance_certificate" do
    assert_difference('InsuranceCertificate.count') do
      post insurance_certificates_url, params: { insurance_certificate: {  } }
    end

    assert_redirected_to insurance_certificate_url(InsuranceCertificate.last)
  end

  test "should show insurance_certificate" do
    get insurance_certificate_url(@insurance_certificate)
    assert_response :success
  end

  test "should get edit" do
    get edit_insurance_certificate_url(@insurance_certificate)
    assert_response :success
  end

  test "should update insurance_certificate" do
    patch insurance_certificate_url(@insurance_certificate), params: { insurance_certificate: {  } }
    assert_redirected_to insurance_certificate_url(@insurance_certificate)
  end

  test "should destroy insurance_certificate" do
    assert_difference('InsuranceCertificate.count', -1) do
      delete insurance_certificate_url(@insurance_certificate)
    end

    assert_redirected_to insurance_certificates_url
  end
end
