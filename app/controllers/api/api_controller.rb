module Api
  class ApiController < ::ApplicationController
    skip_before_filter :verify_authenticity_token

    def current_resource_owner
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end

    protected

    def user_scope
      [:id, :login_name, :image, :created_at, :updated_at]
    end
  end
end
