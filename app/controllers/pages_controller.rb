class PagesController < ApplicationController

  def home
    @title = "Home"
  end

  def landingpage
    @title = "Landing Page"
  end
  
  def show
    @landingpage = Landingpage.find(params[:id])
  end

end
