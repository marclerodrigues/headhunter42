module IntegrationHelpers
  def sign_in(user)
    visit('/user/sign_in')
    fill_in('user[email]', with: user.email)
    fill_in('user[password]', with: user.password)
    click_button('Log in')
  end
end