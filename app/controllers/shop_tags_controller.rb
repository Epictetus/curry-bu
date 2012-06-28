# coding: utf-8
class ShopTagsController < ApplicationController
  before_filter :authenticate_user!

  # POST /shop/1/tags.json
  def create
    shop = Shop.find(params[:shop_id])

    respond_to do |format|
      if shop.add_tag(params[:tag_name])
        shop.reload
        format.json { render json: { status: :ok, data: shop.tag_list }, status: :created }
      else
        format.json { render json: { status: :error }, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop/tags/1.json
  def destroy
    shop = Shop.find(params[:shop_id])

    respond_to do |format|
      if shop.remove_tag(params[:tag_name])
        shop.reload
        format.json { render json: { status: :ok, data: shop.tag_list }, status: :created }
      else
        format.json { render json: { status: :error }, status: :unprocessable_entity }
      end
    end
  end
end
