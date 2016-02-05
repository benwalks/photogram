require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do

  describe "GET #link_through" do
    it "returns http success" do
      get :link_through
      expect(response).to have_http_status(:success)
    end
  end

end
