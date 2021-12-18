module JobsHelper
  def date_expire(job)
    if job.expiring_date < DateTime.now
      'The application deadline has expired'
    else
      "You can apply until: #{@job.expiring_date.strftime('%d/%m/%Y')}"
    end
  end

  def display_employer(job)
    @user = User.find(job.creator_id)
    @user.name
  end

  def display_logo(job)
    @user = User.find(job.creator_id)
    @user.logo || 'gravatar.jpeg'
  end
end
