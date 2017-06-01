class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  # allows all controllers to access our sessions_helper methods
end
