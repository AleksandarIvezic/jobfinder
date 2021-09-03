RSpec.describe "Create new job offer", type: :feature do
  before :each do
    User.create(name: 'User', email: 'user@example.com', password: 'password', password_confirmation: 'password')
  end

  it "when all fields are correct " do
    visit '/users/sign_in'
    
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    
    click_button 'Log in'
    click_link 'Add New Job'
    fill_in 'Name', with: 'Job name example'
    fill_in 'Description', with: 'Job description test field'
    fill_in 'Category', with: 'Job category'
    fill_in "Expiring date", with: "01/01/2022"
    click_button "Create Job"
    expect(page).to have_content 'Job was successfully created.'
  end
end
