require 'rails_helper'

feature 'Deleting comments' do
  background do
    user = create :user
    user_two = create(:user, id: 2,
                             email: 'hi@hi.com',
                             user_name: 'bigrigoz')
    post = create :post
    comment = create(:comment, user_id: user_two.id,
                               post_id: post.id)
    comment_two = create(:comment, id: 2,
                                   post_id: post.id,
                                   content: 'You guys are too kind xo')
    sign_in_with user_two
  end

  scenario 'user can delete their own comments' do
    visit '/'

    expect(page).to have_content('Nice post!')
    click_link 'delete-1'
    expect(page).to_not have_content('Nice post!')
  end

  scenario 'user cannot delete a comment not belonging to them via the ui' do
    visit '/'

    expect(page).to have_content('You guys are too kind xo')
    expect(page).to_not have_css('#delete-2')
  end
end
