class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  

  # GET /items
  # GET /items.json
  def index
    
    @items = Item.where(user_id: current_user.id)
    @email=current_user.email
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    #@item = Item.new
   # @item = current_user.items.build

  end

  # GET /items/1/edit
  def edit
  end




  def complete

    id=params['id']
    item=Item.find(id)
    item.completed=true

    item.save
  end 

  def incomplete

    id=params['id']
    item=Item.find(id)
    item.completed=false;

    item.save

  end 

  # POST /items
  # POST /items.json



  def create
    #@item = Item.new(item_params)
    @item = current_user.items.new(item_params)
      
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:task, :completed)
    end
end
