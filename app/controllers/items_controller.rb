# coding: utf-8
class ItemsController < ApplicationController

  before_filter :authenticate_user!,
    except: [:index, :show]

  # GET /items
  # GET /items.json
  def index
    @items = Item.new_uploads.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    @likes_count = @item.likes.count
    if user_signed_in?
      @like = @item.like_by_user(current_user)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    @shop = Shop.new
    @shops = Shop.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
    @shop = Shop.new

    unless @item.user_id == current_user.id
      return redirect_to root_path
    end
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    @shop = Shop.new
    @item.user_id = current_user.id.to_s

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: '食べたものを登録しました。' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])
    @shop = Shop.new

    unless @item.user_id == current_user.id
      return redirect_to root_path
    end

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: '投稿を編集しました。' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])

    unless @item.user_id == current_user.id
      return redirect_to root_path
    end

    @item.destroy

    redirect_to items_url
  end

  # GET /items/1/toggle_like.json
  def toggle_like
    item = Item.find_by_id(params[:id])
    return render json: { status: :error }, status: :not_found if item.nil?

    response = item.toggle_like(current_user)
    render json: response
  end
end
