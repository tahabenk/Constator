class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show edit update destroy ]
  before_action :action_params

  # GET /reports or /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1 or /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports or /reports.json
  def create
    report_parameters = report_params
    report_parameters[:report_status_id] = 1

    @report = Report.new(report_parameters)
    @report.user_id = current_user.id

    # @report.signatures.attach(signature_params)

    respond_to do |format|
      if @report.save

        DriverReport.create(report: @report, driver_id: current_user.driver.id)
        VehicleAssociation.create(report: @report, vehicle_id: params[:vehicle])

        format.html { redirect_to report_url(@report), notice: "Report was successfully created." }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to report_url(@report), notice: "Report was successfully updated." }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url, notice: "Report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def ownership(report)
    if report.user_id == current_user.id
        return "driver 1"
    else
      @users_on_report = User.joins(driver: :driver_reports).where(driver_reports: { report_id: report.id }).to_a
    # @users_on_report = User.joins(:drivers, :driver_reports).where(driver_reports: { report_id: @report.id }).distinct
      if @users_on_report.include?(current_user)
        return "driver 2"
      else
        return "other"
      end
    end
  end
  helper_method :ownership


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(
      :accident_datetime,
      :address,
      :latitude,
      :longtitude,
      :flag_injury,
      :flag_other_damage,
      :visible_damages,
      :observations
    )
  end

  def signature_params
     params.require(:report).permit(:signatures)
  end

  def action_params
    params.permit(:action)
  end
end
