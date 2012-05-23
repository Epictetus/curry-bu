class ItemCommentsController < ApplicationController
  # GET /item_comments
  # GET /item_comments.json
  def index
    @item_comments = ItemComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_comments }
    end
  end

  # GET /item_comments/1
  # GET /item_comments/1.json
  def show
    @item_comment = ItemComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_comment }
    end
  end

  # GET /item_comments/new
  # GET /item_comments/new.json
  def new
    @item_comment = ItemComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_comment }
    end
  end

  # GET /item_comments/1/edit
  def edit
    @item_comment = ItemComment.find(params[:id])
  end

  # POST /item_comments
  # POST /item_comments.json
  def create
    @item_comment = ItemComment.new(params[:item_comment])

    respond_to do |format|
      if @item_comment.save
        format.html { redirect_to @item_comment, notice: 'Item comment was successfully created.' }
        format.json { render json: @item_comment, status: :created, location: @item_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @item_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_comments/1
  # PUT /item_comments/1.json
  def update
    @item_comment = ItemComment.find(params[:id])

    respond_to do |format|
      if @item_comment.update_attributes(params[:item_comment])
        format.html { redirect_to @item_comment, notice: 'Item comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_comments/1
  # DELETE /item_comments/1.json
  def destroy
    @item_comment = ItemComment.find(params[:id])
    @item_comment.destroy

    respond_to do |format|
      format.html { redirect_to item_comments_url }
      format.json { head :no_content }
    end
  end
end
