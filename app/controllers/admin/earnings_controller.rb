class Admin::EarningsController < ApplicationController
  layout 'admin'
  before_filter :require_admin
  before_filter :find_user , :except => :index

  def index
    @transactions = Transaction.non_zero
  end


  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(params[:transaction])
      if @transaction.save
        @user.update_earnings
        redirect_to(admin_user_path(@user.id), :notice => 'Earning was successfully created.')
      else
        render :action => "new"
      end
  end


  private

  def find_user
    @user = User.find(params[:user_id])
  end

end

