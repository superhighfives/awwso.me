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
    @item = Item.find_by(id: Base58.decode(params[:id]))
    @qr = RQRCode::QRCode.new((CONFIG['use_https'] ? "https://" : "http://") + CONFIG['base_url'] + "/" + Base58.encode(@item.id)).to_img.resize(150, 150).to_data_url
    @identifier = params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end
  
  # GET /items/1
  # GET /items/1.xml
  def redirect
    @item = Item.find_by(id: Base58.decode(params[:id]))
    if @item
      redirect_to @item[:location]
    else
      redirect_to (CONFIG['use_https'] ? "https://" : "http://") + CONFIG['base_url']
    end
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
    @item = Item.new(permitted_params)

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

  private

  # set up permitted params from form
  def permitted_params
    params.require(:item).permit(:location)
  end

end
