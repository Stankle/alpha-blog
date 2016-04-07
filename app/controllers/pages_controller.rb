class PagesController < ApplicationController
	before_action :set_page, only: [:edit, :update, :show, :destroy]

  def home
  end

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:success] = "Page was sucefully created"
      redirect_to page_path(@page)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @page.update(page_params)
		flash[:success] = "Page was successfully updated"
		render 'show'
  end

  def show
  end

  def destroy
    @page.delete
		flash[:danger] = "Page was successfully deleted"
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

	private
		def page_params
			params.require(:page).permit( :title, :description )
		end
		def set_page
			@page = Page.find(params[:id])
		end

end