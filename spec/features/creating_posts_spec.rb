require 'rails_helper'

describe "Creating Posts" do
  it "Can create a post" do
    visit '/'
    click_button "New Post"
    fill_in "comment", with: "#nofilter"
    click_button "submit"

    expect(page).to have_content("#nofilter")
  end
end
