require 'rails_helper'

feature 'editing user profiles' do
  background do
    user = create :user
    user_two = create(:user, id: 2,
                             email: 'hi@hi.com',
                             user_name: 'bigrigoz')
    post = create(:post, user_id: user.id)
    post_two = create(:post, user_id: 2,
                             caption: 'different post yo')
    sign_in_with user

    visit '/'
    click_link 'Arnie'
  end

  scenario 'a user can change their own profile picture' do
    click_link 'Edit Profile'
    click_button 'Choose new profile image'
    # Select the image
    click_button 'Save'

    expect(page.current_path).to be_eq(profile_path('Arnie'))
    expect(page).to have_content('IMAGEFILEHERE')
  end

  scenario "a user cannot change someone elses profile picture" do
  end

  scenario "a user can change their profile bio" do
  end
end
