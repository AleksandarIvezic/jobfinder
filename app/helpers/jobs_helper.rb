module JobsHelper
  def dateExpire(job)
    job.expiring_date < DateTime.now ? "The application deadline has expired" : "You can apply until: #{@job.expiring_date.strftime("%d/%m/%Y")}"
  end 
end
