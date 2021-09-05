module JobsHelper
  def dateExpire(job)
    job.expiring_date < DateTime.now ? "The application deadline has expired" : "You can apply until: #{@job.expiring_date.strftime("%d/%m/%Y")}"
  end 
  def display_employer(job)
    @user = User.find(job.creator_id)
    @user.name    
  end
  def display_logo(job)
    @user = User.find(job.creator_id)
    @user.logo ? @user.logo : 'gravatar.jpeg'
  end

end
