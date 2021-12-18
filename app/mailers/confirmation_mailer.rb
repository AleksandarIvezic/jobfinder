class ConfirmationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirmation_mailer.applicant.subject
  #
  def applicant
    @job_application = params[:job_application]
    @job = params[:job]
    @employer = params[:employer]
    mail from: 'JobFinder <JobFinder@example.com>', to: @job_application.email, subject: 'Successful application'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirmation_mailer.employer.subject
  #
  def employer
    @job_application = params[:job_application]
    @job = params[:job]
    @employer = params[:employer]
    attachments['resume.pdf'] = File.read(@job_application.resume.current_path)
    mail from: 'JobFinder <JobFinder@example.com>', to: @employer.email, subject: 'New application received'
  end
end
