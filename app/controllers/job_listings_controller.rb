class JobListingsController < ApplicationController
  before_action :ensure_user_has_company, only: %i[index new create]
  before_action :set_job_listing, only: %i[show edit update destroy]
  layout "inner_app"

  # GET /job_listings or /job_listings.json
  def index
    @company = current_user.companies.first
    @job_listings = @company.job_listings
  end

  # GET /job_listings/1 or /job_listings/1.json
  def show
    @company = @job_listing.company
  end

  # GET /job_listings/new
  def new
    @company = current_user.companies.first
    @job_listing = @company.job_listings.build
  end

  # POST /job_listings or /job_listings.json
  def create
    @company = current_user.companies.first  # Ensure @company is set
    @job_listing = @company.job_listings.build(job_listing_params)  # Automatically sets company_id

    respond_to do |format|
      if @job_listing.save
        format.html { redirect_to [ @company, @job_listing ], notice: "Job listing was successfully created." }
        format.json { render :show, status: :created, location: [ @company, @job_listing ] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_listings/1
  def edit
    @company = @job_listing.company
  end

  def update
    respond_to do |format|
      if @job_listing.update(job_listing_params)
        format.html { redirect_to @job_listing, notice: "Job listing was successfully updated." }
        format.json { render :show, status: :ok, location: @job_listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_listings/1
  def destroy
    @job_listing.destroy
    respond_to do |format|
      format.html { redirect_to company_job_listings_path(@company), notice: "Job listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_job_listing
      @job_listing = JobListing.find(params[:id])
    end

    # Ensure the user has at least one company before accessing job listings
    def ensure_user_has_company
      unless current_user.companies.exists?
        redirect_to new_company_path, alert: "You need to create a company first before managing job listings."
      end
    end

    # Only allow a list of trusted parameters through.
    def job_listing_params
      params.require(:job_listing).permit(:title, :description, :location, :remote, :salary_range, :job_type_id, :visa_sponsorship, :relocation_assistance, :skills, :experience_level_id, :education_requirements, :job_benefits, :job_category_id, :job_status, :job_reference_id, :job_duration, :work_hours, :interview_process, :keywords, :remote_work_requirements, :job_function, :company_id)
    end
end
