require "rails_helper"

RSpec.describe ConfirmationMailer, :type => :mailer do
  before :each do
    User.delete_all
    Job.delete_all

    @employer = User.create(name: 'User', email: 'user@example.com', password: 'password', password_confirmation: 'password')
  
    @job = @employer.jobs.create(
      name: 'Full-Stack developer',
      description: "    
      Some description
      ",
      category: "Web development",
      expiring_date: "14-12-2021"
    )
  
    @file = File.open("public/apple-touch-icon.png")
    @job_application = @job.job_applications.create(name: "test",birth_date:'12/12/1989', email:'mail@test.com', phone:'123456789', address:'Test adress', professional_qualifications: 'VSS', resume:@file, job_id:'1')
   
  end
 
  it "applicant action renders the headers" do 
    mailer = ConfirmationMailer.with(job_application: @job_application, job: @job, employer: @employer).applicant
    expect(mailer.subject).to eq("Successful application")
    expect(mailer.from).to eq(["JobFinder@example.com"])
    expect(mailer.to).to eq([@job_application.email])
  end

  it "applicant renders the body" do
    mailer = ConfirmationMailer.with(job_application: @job_application, job: @job, employer: @employer).applicant
    expect(mailer.body.encoded).to match("Dear #{@job_application.name}")
  end  

  it "employer action renders the headers" do 
    mailer = ConfirmationMailer.with(job_application: @job_application, employer: @employer).employer
    expect(mailer.subject).to eq("New application received")
    expect(mailer.from).to eq(["JobFinder@example.com"])
    expect(mailer.to).to eq([@employer.email])
    expect(mailer.attachments.length).to be(1)
    expect(mailer.attachments[0]).to be_a_kind_of(Mail::Part)
    expect(mailer.attachments[0].content_type).to be_start_with('application/pdf;')
    expect(mailer.attachments[0].filename).to eq('resume.pdf')
  end

  it "employer renders the body" do
    mailer = ConfirmationMailer.with(job_application: @job_application, employer: @employer).employer
    expect(mailer.body.encoded).to match("Dear \"#{@employer.name}\",")
  end  
  
end

