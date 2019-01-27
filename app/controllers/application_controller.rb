class ApplicationController < ActionController::Base
  def not_found
    render file: 'public/404.html', status: :not_found, layout: false
  end

  private

  def set_user_uuid
    unless cookies[:user_uuid].present?
      cookies.permanent[:user_uuid] = SecureRandom.uuid
    end

    @user_uuid = cookies[:user_uuid]
  end
end
