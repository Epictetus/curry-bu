module Api
  class ItemsController < ApiController
    doorkeeper_for :create

    respond_to :json

    # GET /api/items.json
    def index
      items = Item.includes([:user, :shop]).new_uploads.page(params[:page])
      respond_with items.to_json(
        include: {
          user: { only: self.user_scope },
          shop: {}
        }
      )
    end

    # GET /api/items/1.json
    def show
      item = Item.find_by_id(params[:id])

      status = (item) ? :ok : :not_found

      respond_with item.to_json(
        include: {
          user: { only: self.user_scope },
          shop: {}
        }
      )
    end

    # POST /api/items.json
    def create
      item = Item.new(params[:item])
      item.user_id = current_resource_owner.id
      item.save

      respond_with(
        item.to_json(
          include: {
            user: { only: self.user_scope },
            shop: {}
          }
        ),
        location: item
      )
    end
  end
end
