require 'spec_helper'

feature 'viewing individual posts' do
  background do
    user = create :user
    post = create(:post, user_id: user.id)

    sign_in_with user
  end
  scenario 'can click and view a single post from the index' do
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(1))
  end
end
