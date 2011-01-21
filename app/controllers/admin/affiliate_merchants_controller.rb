class Admin::AffiliateMerchantsController < ApplicationController
  layout 'admin'
  before_filter :require_admin

  def index
    @affiliate_merchants = AffiliateMerchant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @affiliate_merchants }
    end
  end

  # GET /affiliate_merchants/1
  # GET /affiliate_merchants/1.xml
  def show
    @affiliate_merchant = AffiliateMerchant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @affiliate_merchant }
    end
  end

  # GET /affiliate_merchants/new
  # GET /affiliate_merchants/new.xml
  def new
    @affiliate_merchant = AffiliateMerchant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @affiliate_merchant }
    end
  end

  # GET /affiliate_merchants/1/edit
  def edit
    @affiliate_merchant = AffiliateMerchant.find(params[:id])
  end

  # POST /affiliate_merchants
  # POST /affiliate_merchants.xml
  def create
    @affiliate_merchant = AffiliateMerchant.new(params[:affiliate_merchant])

    respond_to do |format|
      if @affiliate_merchant.save
        format.html { redirect_to(admin_affiliate_merchants_url, :notice => 'Affiliate merchant was successfully created.') }
        format.xml  { render :xml => @affiliate_merchant, :status => :created, :location => @affiliate_merchant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @affiliate_merchant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /affiliate_merchants/1
  # PUT /affiliate_merchants/1.xml
  def update
    @affiliate_merchant = AffiliateMerchant.find(params[:id])

    respond_to do |format|
      if @affiliate_merchant.update_attributes(params[:affiliate_merchant])
        format.html { redirect_to(admin_affiliate_merchants_url, :notice => 'Affiliate merchant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @affiliate_merchant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliate_merchants/1
  # DELETE /affiliate_merchants/1.xml
  def destroy
    @affiliate_merchant = AffiliateMerchant.find(params[:id])
    @affiliate_merchant.destroy

    respond_to do |format|
      format.html { redirect_to(admin_affiliate_merchants_url) }
      format.xml  { head :ok }
    end
  end
end

