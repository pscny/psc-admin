class ApplicationController < ActionController::Base
  Include SimpleSessions

  protect_from_forgery

  before_filter :authenticate_admin!
end
