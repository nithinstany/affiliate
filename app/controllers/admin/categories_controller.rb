class Admin::CategoriesController < ApplicationController
  layout 'admin'
  before_filter :require_admin

  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])
  end


  def new
    @category = Category.new
  end

  def edit
     @category = Category.find(params[:id])
  end


  def create
     @category= Category.new(params[:category])
    if @category.save
     redirect_to(admin_categories_url, :notice => "#{ @category.name} is successfully created.")
    else
      render :action => "new"
    end
  end


  def update
     @category = Category.find(params[:id])

    if  @category.update_attributes(params[:category])
       redirect_to(admin_categories_url, :notice => "#{ @category.name} was successfully updated.")
    else
      render :action => "edit"
    end
  end

  def destroy
     @category = Category.find(params[:id])
     @category.destroy
    redirect_to(admin_categories_url)
  end


end

