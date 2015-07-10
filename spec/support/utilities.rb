def login(user)
  visit '/'
  click_link 'login'
  fill_in 'email', with: user.email
  fill_in 'password', with: user.password

  click_on 'submit'
end
