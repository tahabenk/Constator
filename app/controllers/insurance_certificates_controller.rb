class InsuranceCertificatesController < ApplicationController
  before_action :set_insurance_certificate, only: %i[ show edit update destroy ]

  # GET /insurance_certificates or /insurance_certificates.json
  def index
    @insurance_certificates = InsuranceCertificate.all
  end

  # GET /insurance_certificates/1 or /insurance_certificates/1.json
  def show
  end

  # GET /insurance_certificates/new
  def new
    @insurance_certificate = InsuranceCertificate.new
  end

  # GET /insurance_certificates/1/edit
  def edit
  end

  # POST /insurance_certificates or /insurance_certificates.json
  def create
    @insurance_certificate = InsuranceCertificate.new(insurance_certificate_params)

    respond_to do |format|
      if @insurance_certificate.save
        format.html { redirect_to insurance_certificate_url(@insurance_certificate), notice: "Insurance certificate was successfully created." }
        format.json { render :show, status: :created, location: @insurance_certificate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @insurance_certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insurance_certificates/1 or /insurance_certificates/1.json
  def update
    respond_to do |format|
      if @insurance_certificate.update(insurance_certificate_params)
        format.html { redirect_to insurance_certificate_url(@insurance_certificate), notice: "Insurance certificate was successfully updated." }
        format.json { render :show, status: :ok, location: @insurance_certificate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @insurance_certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurance_certificates/1 or /insurance_certificates/1.json
  def destroy
    @insurance_certificate.destroy

    respond_to do |format|
      format.html { redirect_to insurance_certificates_url, notice: "Insurance certificate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance_certificate
      @insurance_certificate = InsuranceCertificate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def insurance_certificate_params
      params.fetch(:insurance_certificate, {})
    end
end
