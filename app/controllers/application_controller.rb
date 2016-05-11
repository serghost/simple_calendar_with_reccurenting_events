class ApplicationController < ActionController::Base
  private

  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
