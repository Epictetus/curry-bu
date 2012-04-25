class HomeController < ApplicationController
  def index
    @items = Item.ate_new.all
  end
end
