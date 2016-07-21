def sign_up(email: 'test@example.com', password: 'testtest', pas_confirmation: 'testtest')
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: pas_confirmation)
  click_button('Sign up')
end

def login_approved_user_factory_girl
  user = FactoryGirl.create(:user, :approved)
  login_as(user, scope: :user)
  visit('/')
end
