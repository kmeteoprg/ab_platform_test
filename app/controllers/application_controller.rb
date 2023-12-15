class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def current_device
    head 404 and return if request.headers["Device-Token"].blank?

    Device.find_or_create_by(token: request.headers["Device-Token"])
  end
end
