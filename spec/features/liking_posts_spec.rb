require 'rails_helper'

feature 'Liking posts' do
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
  end

  scenario 'can like a post' do
    click_link 'like_1'

    expect(page).to have_css('div.liked-post')
    expect(find('.post-likers')).to have_content('Arnie')
  end
end

feature 'Unliking posts' do

end
