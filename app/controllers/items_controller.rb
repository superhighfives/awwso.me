class ItemsController < ApplicationController
  # GET /items
  # GET /items.xml
  #def index
  #  @items = Item.all
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @items }
  #  end
  #end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find_by_id(Base58.decode(params[:id]))
    @identifier = Base58.decode(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end
  
  # GET /items/1
  # GET /items/1.xml
  def redirect
    @item = Item.find_by_id(Base58.decode(params[:id]))
    redirect_to @item[:location]
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to "/new/" + Base58.encode(@item.id) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

end
