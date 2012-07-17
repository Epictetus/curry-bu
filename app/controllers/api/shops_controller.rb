module Api
  class ShopsController < ApiController
    doorkeeper_for :create

    respond_to :json

    # GET /api/shops.json
    def index
      respond_with Shop.all
    end

    # GET /api/shops/1.json
    def show
      shop = Shop.find_by_id(params[:id])

      status = (shop) ? :ok : :not_found

      respond_with shop, status: status
    end

    # POST /api/shops.json
    def create
      shop = Shop.new(params[:shop])
      shop.create_user_id = current_resource_owner.id
      shop.update_user_id = current_resource_owner.id
      shop.save

      respond_with(shop, location: shop)
    end
  end
end
