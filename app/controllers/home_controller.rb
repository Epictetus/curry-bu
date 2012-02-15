class HomeController < ApplicationController
  def index
    @images = Image.order("ate_at DESC").all
  end
end
