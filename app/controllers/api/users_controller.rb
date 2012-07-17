module Api
  class UsersController < ApiController
    respond_to :json

    # GET /api/users.json
    def index
      respond_with User.all,
        only: self.user_scope
    end

    # GET /api/users/1.json
    def show
      user = User.find_by_id(params[:id])

      status = (user) ? :ok : :not_found

      respond_with user,
        only: self.user_scope, status: status
    end
  end
end
