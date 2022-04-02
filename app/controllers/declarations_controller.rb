class DeclarationsController < ApplicationController
  before_action :set_declaration, only: %i[ show edit update destroy ]

  # GET /declarations or /declarations.json
  def index
    @declarations = Declaration.all
  end

  # GET /declarations/1 or /declarations/1.json
  def show
  end

  # GET /declarations/new
  def new
    @declaration = Declaration.new
  end

  # GET /declarations/1/edit
  def edit
  end

  # POST /declarations or /declarations.json
  def create
    @declaration = Declaration.new(declaration_params)

    respond_to do |format|
      if @declaration.save
        format.html { redirect_to declaration_url(@declaration), notice: "Declaration was successfully created." }
        format.json { render :show, status: :created, location: @declaration }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @declaration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /declarations/1 or /declarations/1.json
  def update
    respond_to do |format|
      if @declaration.update(declaration_params)
        format.html { redirect_to declaration_url(@declaration), notice: "Declaration was successfully updated." }
        format.json { render :show, status: :ok, location: @declaration }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @declaration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /declarations/1 or /declarations/1.json
  def destroy
    @declaration.destroy

    respond_to do |format|
      format.html { redirect_to declarations_url, notice: "Declaration was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_declaration
      @declaration = Declaration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def declaration_params
      params.permit(:report).require(
        :flag_police_report,
        :flag_police_statement,
        :police_station,
        :flag_usual_driver,
        :flag_usual_resident,
        :flag_single,
        :flag_employee,
        :driving_reason,
        :usual_parking_place,
        :expertise_garage,
        :expertise_date,
        :expertise_phone_contact,
        :trailing_vehicule_registration_number,
        :other_damages_description,
        :other_damages_thirdparty_name,
        :other_damages_thirdparty_address,
        :declaration_datetime,
        :insurance_policy,
      )
    end
end
