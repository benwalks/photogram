require 'rails_helper'

feature 'viewing user profiles' do
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

  scenario 'visiting a profile page shows the user name in the url' do
    expect(page.current_path).to eq(profile_path('Arnie'))
  end

  scenario "a profile page only shows the specified user's posts" do
    expect(page).to have_content 'nofilter'
    expect(page).to_not have_content 'different post yo'
  end
end
