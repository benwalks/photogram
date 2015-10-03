require 'rails_helper'

feature 'Creating posts' do
  background do
    user = create :user
    sign_in_with user
  end
  scenario 'can create a new post' do
    visit '/'
    click_link 'New Post'
    attach_file('post_image', "spec/files/images/coffee.jpg")
    fill_in 'post_caption', with: "nom nom nom #coffeetime"
    click_button 'Create Post'
    expect(page).to have_content("#coffeetime")
    expect(page).to have_css("img[src*='coffee']")
    expect(page).to have_content('Arnie')
  end
  scenario 'a post needs an image to save' do
    visit '/'
    click_link 'New Post'
    fill_in 'post_caption', with: "No picture because YOLO"
    click_button 'Create Post'
    expect(page).to have_content("Upload an image: can't be blank")
  end
end
