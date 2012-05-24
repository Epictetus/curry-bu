# coding: utf-8
class ItemCommentsController < ApplicationController
  # POST /item_comments
  # POST /item_comments.json
  def create
    @item = Item.find(params[:item_id])
    @item_comment = @item.item_comments.new params[:item_comment]
    @item_comment.user = current_user

    respond_to do |format|
      if @item_comment.save
        format.html { redirect_to @item, notice: 'コメントを登録しました。' }
        format.json { render json: @item, status: :created, location: @item_comment }
      else
        format.html { render action: @item }
        format.json { render json: @item_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_comments/1
  # DELETE /item_comments/1.json
  def destroy
    @item = Item.find(params[:item_id])
    item_comment = @item.item_comments.find(params[:id])
    item_comment.destroy if item_comment.user == current_user

    respond_to do |format|
      format.html { redirect_to @item }
      format.json { head :no_content }
    end
  end
end
