require 'rails_helper'

describe "the creating a new user process" do
  it "will add a new user" do
    visit '/'
    click_link 'signup'
    fill_in 'first', with: 'Bob'
    fill_in 'last', with: 'Bobby'
    fill_in 'email', with: 'foo@foo.com'
    fill_in 'password', with: '12345678'
    fill_in 'confirm', with: '12345678'
    click_on 'submit'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end

describe "logging in" do
  it "Will log in a user" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'login'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password

    click_on 'submit'
    expect(page).to have_content 'Signed in successfully.'
  end
end

describe 'logging out' do
  it 'will log out a user' do
    user = FactoryGirl.create(:user)
    login(user)
    click_link user.email
    click_link 'logout'
    expect(page).to have_content 'Signed out successfully.'
  end
end

describe 'visiting user profile' do
  it "will go to a users profile" do
    user = FactoryGirl.create(:user)
    login(user)
    click_link user.email
    click_link 'profile'
    expect(page).to have_content "Profile for " + user.first_name
  end

  it "will allow a logged in user to edit their profile" do
    user = FactoryGirl.create(:user)
    login(user)
    click_link user.email
    click_link 'profile'
    click_link 'edit-user'
    expect(page).to have_content "Edit"
  end


  it "will allow a logged in user to input profile info" do
    user = FactoryGirl.create(:user)
    login(user)
    click_link user.email
    click_link 'profile'
    click_link 'edit-user'
    fill_in 'first', with: 'Bubba'
    fill_in 'last', with: 'loser'
    fill_in 'confirm', with: '12345678'
    click_button 'update'
    expect(page).to have_content "Your account"
  end

end
