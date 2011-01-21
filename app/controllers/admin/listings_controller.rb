class Admin::ListingsController < ApplicationController
  layout 'admin'
  before_filter :require_admin

  def index
     #@category = Category.find(params[:category_id])
    @admin_listings =  Listing.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_listings }
    end
  end

  # GET /admin/listings/1
  # GET /admin/listings/1.xml
  def show
    @admin_listing = Listing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_listing }
    end
  end

  # GET /admin/listings/new
  # GET /admin/listings/new.xml
  def new
    #@category = Category.find(params[:category_id])
    @admin_listing = Listing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_listing }
    end
  end

  # GET /admin/listings/1/edit
  def edit
    @admin_listing = Listing.find(params[:id])
  end

  # POST /admin/listings
  # POST /admin/listings.xml
  def create
      #@category = Category.find(params[:listing][:category_id])
    @admin_listing = Listing.new(params[:listing])

    respond_to do |format|
      if @admin_listing.save
        format.html { redirect_to(admin_listings_url, :notice => 'Listing was successfully created.') }
        format.xml  { render :xml => @admin_listing, :status => :created, :location => @admin_listing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/listings/1
  # PUT /admin/listings/1.xml
  def update
    @admin_listing = Listing.find(params[:id])

    respond_to do |format|
      if @admin_listing.update_attributes(params[:listing])
        format.html { redirect_to(admin_listings_url, :notice => 'Listing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/listings/1
  # DELETE /admin/listings/1.xml
  def destroy
    @admin_listing = Listing.find(params[:id])
    @admin_listing.destroy

    respond_to do |format|
      format.html { redirect_to(admin_listings_url) }
      format.xml  { head :ok }
    end
  end
end

