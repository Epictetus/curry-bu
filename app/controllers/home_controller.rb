class HomeController < ApplicationController
  def index
    @items = Item.new_uploads.all
  end
end
