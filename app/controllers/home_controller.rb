class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
  end

  def faq
  end

  def about
  end

  def special_instructions
  end

end

