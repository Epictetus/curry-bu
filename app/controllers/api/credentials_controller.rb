module Api
  class CredentialsController < ApiController
    doorkeeper_for :all

    respond_to :json

    # GET /api/me.json
    def me
      respond_with current_resource_owner,
        only: self.user_scope
    end
  end
end
