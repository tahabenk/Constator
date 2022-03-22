class InsurancePoliciesController < ApplicationController
  before_action :set_insurance_policy, only: %i[ show edit update destroy ]

  # GET /insurance_policies or /insurance_policies.json
  def index
    @insurance_policies = InsurancePolicy.all
  end

  # GET /insurance_policies/1 or /insurance_policies/1.json
  def show
  end

  # GET /insurance_policies/new
  def new
    @insurance_policy = InsurancePolicy.new
  end

  # GET /insurance_policies/1/edit
  def edit
  end

  # POST /insurance_policies or /insurance_policies.json
  def create
    @insurance_policy = InsurancePolicy.new(insurance_policy_params)

    respond_to do |format|
      if @insurance_policy.save
        format.html { redirect_to insurance_policy_url(@insurance_policy), notice: "Insurance policy was successfully created." }
        format.json { render :show, status: :created, location: @insurance_policy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @insurance_policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insurance_policies/1 or /insurance_policies/1.json
  def update
    respond_to do |format|
      if @insurance_policy.update(insurance_policy_params)
        format.html { redirect_to insurance_policy_url(@insurance_policy), notice: "Insurance policy was successfully updated." }
        format.json { render :show, status: :ok, location: @insurance_policy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @insurance_policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurance_policies/1 or /insurance_policies/1.json
  def destroy
    @insurance_policy.destroy

    respond_to do |format|
      format.html { redirect_to insurance_policies_url, notice: "Insurance policy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance_policy
      @insurance_policy = InsurancePolicy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def insurance_policy_params
      params.fetch(:insurance_policy, {})
    end
end
