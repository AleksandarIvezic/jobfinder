# Preview all emails at http://localhost:3000/rails/mailers/confirmation_mailer
class ConfirmationMailerPreview < ActionMailer::Preview
  
  # Preview this email at http://localhost:3000/rails/mailers/confirmation_mailer/applicant
  def applicant
    @job = Job.find(8)
    @job_application = JobApplication.last
    @employer = User.find(@job.creator_id);
    ConfirmationMailer.with(job_application: @job_application, job: @job, employer: @employer).applicant
  end

  # Preview this email at http://localhost:3000/rails/mailers/confirmation_mailer/employer
  def employer
    @job = Job.find(8)
    @job_application = JobApplication.last
    @employer = User.find(@job.creator_id);
    ConfirmationMailer.with(job_application: @job_application,employer: @employer).employer
  end

end
