class TestsController < ApplicationController

  skip_before_filter :authenticate_member!

  def index
    render :json => auth_hash.to_json
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
