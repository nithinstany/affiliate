class Admin::EarningsController < ApplicationController
  layout 'admin'
  before_filter :require_admin

  def index
    @transactions = Transaction.non_zero
  end

end

