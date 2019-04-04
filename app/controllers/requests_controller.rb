class RequestsController < ApplicationController

  def create
      current_user.active_requests.create(create_params)
  end

  private

  def create_params
      params.permit(:request_id)
  end
end
