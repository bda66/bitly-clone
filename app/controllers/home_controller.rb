class HomeController < ApplicationController
  before_action :set_user_uuid
  def index
    @user_links = Link.user_links(@user_uuid)
  end
end
