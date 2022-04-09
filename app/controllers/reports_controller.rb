class ReportsController < ApplicationController
  before_action :set_report, only: [ :show, :edit, :update, :destroy ]
  before_action :action_params

  # GET /reports or /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1 or /reports/1.json
  def show
    @markers =
      [{
        lat: @report.latitude,
        lng: @report.longitude,
        image_url: helpers.asset_url("https://www.pngplay.com/wp-content/uploads/14/Flintstones-Car-Transparent-PNG.png")
      }]
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
    @report = Report.new
    @report.report_status_id = 1
    datetime=DateTime.civil(report_params["accident_datetime(1i)"].to_i, report_params["accident_datetime(2i)"].to_i, report_params["accident_datetime(3i)"].to_i,
                            report_params["accident_datetime(4i)"].to_i,report_params["accident_datetime(5i)"].to_i, 0)
    @report.accident_datetime = datetime
    @report.driver_1_id = current_user.driver.id

    driver_2 = Driver.find(driver_params.split('-')[0])
    @report.driver_2_id = driver_2.id

    vehicle_1 = Vehicle.find(vehicule_params)
    @report.vehicle_1_id = vehicle_1.id

    data_uri = report_params[:signatures]
    encoded_image = data_uri.split(",")[1]
    decoded_image = Base64.decode64(encoded_image)
    File.open("signature.png", "wb") { |f| f.write(decoded_image) }
    @report.signatures.attach(io: File.open('signature.png'), filename: 'signature.png')

    # binding.pry

    respond_to do |format|
      if @report.save


        # DriverReport.create(report: @report, driver_id: current_user.driver.id)
        # DriverReport.create(report: @report, driver_id: driver_id)
        # Ajouter le 2eme driver mais comment récupérer le 2eme à partir de la recherche DriverReport.create(report: @report, driver_id: current_user.driver.id)
        # VehicleAssociation.create(report: @report, vehicle_id:  vehicule_params)

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

  # def ownership(report)
  #   if report.user_id == current_user.id
  #       return "driver 1"
  #   else
  #     @users_on_report = User.joins(driver: :driver_reports).where(driver_reports: { report_id: report.id }).to_a
  #   # @users_on_report = User.joins(:drivers, :driver_reports).where(driver_reports: { report_id: @report.id }).distinct
  #     if @users_on_report.include?(current_user)
  #       return "driver 2"
  #     else
  #       return "other"
  #     end
  #   end
  # end
  # helper_method :ownership


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:accident_datetime, :signatures)
  end

  def vehicule_params
    params.permit(:vehicle_id).require(:vehicle_id)
  end

  def driver_params
    params.permit(:driver).require(:driver)
  end

  def action_params
    params.permit(:action)
  end

end
