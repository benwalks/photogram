require 'rails_helper'

feature 'Can see a list of posts on the index' do
  background do
    user = create :user
    post_one = create(:post, caption: 'This is post one',
                            user_id: user.id)
    post_two = create(:post, caption: 'This is the second post',
                            user_id: user.id)

    sign_in_with user
  end
  scenario 'the index lists all posts' do
    expect(page).to have_content('This is post one')
    expect(page).to have_content('This is the second post')
    expect(page).to have_css("img[src*='coffee']")
  end
end
