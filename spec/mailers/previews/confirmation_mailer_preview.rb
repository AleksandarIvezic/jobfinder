# Preview all emails at http://localhost:3000/rails/mailers/confirmation_mailer
class ConfirmationMailerPreview < ActionMailer::Preview
  
  # Preview this email at http://localhost:3000/rails/mailers/confirmation_mailer/applicant
  def applicant
    @job = Job.first
    
    @file = File.open("public/apple-touch-icon.png")
    @job_application = @job.job_applications.create(name: "test",birth_date:'12/12/1989', email:'mail@test.com', phone:'123456789', address:'Test adress', professional_qualifications: 'VSS', resume:@file, job_id:'1')
   
    @employer = User.find(@job.creator_id);
    ConfirmationMailer.with(job_application: @job_application, job: @job, employer: @employer).applicant
  end

  # Preview this email at http://localhost:3000/rails/mailers/confirmation_mailer/employer
  def employer
    @job = Job.first
    
    @file = File.open("public/apple-touch-icon.png")
    @job_application = @job.job_applications.create(name: "test",birth_date:'12/12/1989', email:'mail@test.com', phone:'123456789', address:'Test adress', professional_qualifications: 'VSS', resume:@file, job_id:'1')
   
    @employer = User.find(@job.creator_id);
    ConfirmationMailer.with(job_application: @job_application,employer: @employer).employer
  end

end
