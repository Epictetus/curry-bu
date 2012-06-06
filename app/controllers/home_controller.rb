class HomeController < ApplicationController
  def index
    @items = Item.new_uploads.page params[:page]
  end
end
