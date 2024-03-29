class JobApplicationsController < ApplicationController
  before_action :set_select_collections, only: %i[new create]
  def index
    if params[:id]
      @job = Job.find(params[:id])
      @job_applications = JobApplication.where('job_id = ?', @job.id)
    else
      redirect_to :jobs
    end
  end

  def show
    @job_application = JobApplication.find(params[:id])
    @pdf_filename = File.join(Rails.public_path, @job_application.resume.to_s)
    send_file(@pdf_filename, filename: 'Resume.pdf', disposition: 'inline', type: 'application/pdf')
  end

  # GET /jobs/new
  def new
    @job = Job.find(params[:id])
    @job_application = @job.job_applications.build
    @job_params = params
  end

  # GET /jobs/1/edit
  def edit; end

  # POST /jobs or /jobs.json
  def create
    @job = Job.find(job_application_params[:job_id])
    @job_application = @job.job_applications.build(job_application_params)
    @employer = User.find(@job.creator_id)

    respond_to do |format|
      if @job_application.save
        ConfirmationMailer.with(job_application: @job_application, job: @job,
                                employer: @employer).applicant.deliver_later
        ConfirmationMailer.with(job_application: @job_application, employer: @employer).employer.deliver_later
        format.html { redirect_to :root, notice: 'Job application was successfully created.' }
        format.json { render :root, status: :created, location: @job_application }
      else
        format.html { render action: :new, status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        format.html { redirect_to @job_application, notice: 'Job application was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job_application.destroy
    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: 'Job application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job_application = JobApplication.find(params[:id])
  end

  def set_select_collections
    @qual_options = %w[VSS VKŠ SSS NK]
  end

  # Only allow a list of trusted parameters through.
  def job_application_params
    params.require(:job_application).permit(:name, :birth_date, :email, :phone, :address,
                                            :professional_qualifications, :resume, :job_id)
  end
end
