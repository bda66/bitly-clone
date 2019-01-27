class LinksController < ApplicationController
  before_action :set_link
  before_action :set_user_uuid

  def index
    @user_links = Link.user_links(@user_uuid)
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(
      original_url: params[:link][:original_url],
      short_url: SecureRandom.hex(3),
      created_by: @user_uuid
    )

    if @link.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @link.add_click

    redirect_to "http://#{@link.original_url}"
  end

  def edit
    @link = Link.find_by(id: params[:id])
    redirect_to :root if @link.created_by != @user_uuid
  end

  def update
    @link = Link.find_by(id: params[:id])
    return if @link.created_by != @user_uuid

    if @link.update(link_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @link = Link.find_by(id: params[:id])
    @link.destroy
    redirect_to :root
  end

  private

  def set_link
    @link = Link.find_by_short_url(params[:short_url])
  end

  def link_params
    params.require(:link).permit(:short_url)
  end
end
