class LinksController < ApplicationController
  before_action :set_link
  before_action :set_user_uuid, only: %i(edit delete)

  def show
    @link.add_click

    redirect_to "http://#{@link.original_url}"
  end

  private

  def set_link
    @link = Link.find_by_short_url(params[:short_url])
  end
end
