class HomeController < ApplicationController
  def index
    @items = Item.order("ate_at DESC").all
  end
end
