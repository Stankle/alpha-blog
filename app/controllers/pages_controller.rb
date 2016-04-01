class PagesController < ApplicationController

  def home
  end

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params.require(:page).permit( :title, :description ))
    if @page.save
      flash[:notice] = "Page was sucefully created"
      redirect_to pages_path
    else
      render 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @page.update(params.require(:page).permit( :title, :description ))
    redirect_to pages_path
  end

  def show
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.delete
    redirect_to pages_path
  end

  def search
    @page = Page.find_by id: params[:q]
    if @page.nil?
      flash[:not_found] = "Page not found"
      redirect_to pages_path
    else
      redirect_to page_path(@page)
    end
  end

  def about
  end
end