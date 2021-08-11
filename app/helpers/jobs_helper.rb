module JobsHelper
  def dateExpire
    content = ""
    @job.expiring_date < DateTime.now ? content = "The application deadline has expired" : content = "You can apply until: #{@job.expiring_date.strftime("%d/%m/%Y")}"
    content;
  end 
end
