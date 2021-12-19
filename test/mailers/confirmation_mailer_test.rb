require 'test_helper'

class ConfirmationMailerTest < ActionMailer::TestCase
  test 'applicant' do
    @job = Job.last
    @job_application = JobApplication.create(name: 'User',
                                             birth_date: '15/03/1990',
                                             email: 'applicant@mail.com',
                                             phone: '3818939847899',
                                             address: 'Street num. 5',
                                             professional_qualifications: 'VSS',
                                             resume: 'public/uploads/job_application/resume/63/assignment_R2.pdf',
                                             job_id: '8')
    @employer = User.find(@job.creator_id)
    mail = ConfirmationMailer.with(job_application: @job_application, job: @job,
                                   employer: @employer).applicant.deliver_later
    assert_equal 'Applicant', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'employer' do
    @job = Job.last
    @job_application = JobApplication.create(name: 'User',
                                             birth_date: '15/03/1990',
                                             email: 'applicant@mail.com',
                                             phone: '3818939847899',
                                             address: 'Street num. 5',
                                             professional_qualifications: 'VSS',
                                             resume: 'public/uploads/job_application/resume/63/assignment_R2.pdf',
                                             job_id: '8')
    @employer = User.find(@job.creator_id)
    mail = ConfirmationMailer.with(job_application: @job_application, job: @job,
                                   employer: @employer).employer.deliver_later
    assert_equal 'Employer', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
