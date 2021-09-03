RSpec.describe "The sign in process", type: :feature do
  before :each do
    User.create(name: 'User', email: 'user@example.com', password: 'password', password_confirmation: 'password')
  end

  it "signs me in if I am registered" do
    visit '/users/sign_in'
    
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
  it "throws error if I am not registered" do
    visit '/users/sign_in'
    
      fill_in 'Email', with: 'user1@example.com'
      fill_in 'Password', with: 'password1'
    
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end
