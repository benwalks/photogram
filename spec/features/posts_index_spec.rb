require 'rails_helper'

describe "Post Index" do
  it "can view the index page" do
    visit '/'

    expect(page).to have_content("Photogram")
  end
end
