class ProfilesController < ApplicationController
  def show
    @posts = User.find_by(user_name: params[:user_name]).posts
  end
end
