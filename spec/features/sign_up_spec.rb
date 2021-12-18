RSpec.describe 'Sign up process', type: :feature do
  it 'new user sign up successfully' do
    visit '/users/sign_up'
    fill_in 'Name', with: 'username'
    fill_in 'Email', with: 'mail@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
  it "doesn't sign up if user already exist" do
    visit '/users/sign_up'
    fill_in 'Name', with: 'username'
    fill_in 'Email', with: 'mail@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    click_link 'Logout'
    visit '/users/sign_up'
    fill_in 'Name', with: 'username'
    fill_in 'Email', with: 'mail@example.com'
    fill_in 'Password', with:
     'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Email has already been taken'
  end
end
