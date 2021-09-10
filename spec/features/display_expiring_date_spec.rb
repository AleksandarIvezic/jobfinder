RSpec.describe "The expiring date", type: :feature, js: true do
  before :each do
    User.create(name: 'User', email: 'user@example.com', password: 'password', password_confirmation: 'password')
  end

  it "when deadline is not expired yet, date is displayed" do
    visit '/users/sign_in'    
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'    
    click_button 'Log in'
    click_link 'Create a job offer'
    fill_in 'Job title', with: 'Job name example'
    find('#job_description').set('Job description test field')
    fill_in 'Category', with: 'Job category'
    fill_in "Expiring date", with: "01/01/2022"
    click_button "Create Job"
    expect(page).to have_content 'You can apply until: 01/01/2022'
  end
  it "when deadline is expired yet, date is not displayed" do
    visit '/users/sign_in'    
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'    
    click_button 'Log in'
    click_link 'Create a job offer'
    fill_in 'Job title', with: 'Job name example'
    find('#job_description').set('Job description test field')
    fill_in 'Category', with: 'Job category'
    fill_in "Expiring date", with: "01/01/2021"
    click_button "Create Job"
    expect(page).to have_content 'The application deadline has expired'
  end
end