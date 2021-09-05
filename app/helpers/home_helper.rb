module HomeHelper
  def job_offer_path
    user_signed_in? ? new_job_path : new_user_registration_path
  end
end
