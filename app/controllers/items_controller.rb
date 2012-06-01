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
    @like = @item.like_by_user(current_user)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    @shops = Shop.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
    #@shops = Shop.all
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    @item.user_id = current_user.id.to_s

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
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

    if not @item.user_id == current_user.id
      redirect_to request.referer
    end

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
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

    if @item.user_id == current_user.id
      @item.destroy
    end

    redirect_to items_url
  end

  def toggle_like
    item = Item.find_by_id(params[:id])
    return render json: {status: :error}, status: :not_found if item.nil?

    response = item.toggle_like(current_user)
    render json: response
  end
end
