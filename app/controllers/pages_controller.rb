class PagesController < ApplicationController
	before_action :set_page, only: [:edit, :update, :show, :destroy]
	before_action :set_locale
	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
		if !params[:locale].nil?
			I18n.default_locale = params[:locale]
		end
	end

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
		@page.user = User.first
    if @page.save
      flash[:success] = t(:page_created)
      redirect_to page_path(@page)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @page.update(page_params)
		flash[:success] = t(:page_updated)
		render 'show'
  end

  def show
  end

  def destroy
    @page.delete
		flash[:danger] = t(:page_deleted)
    redirect_to pages_path
  end

  def search
    @page = Page.find_by id: params[:q]
    if @page.nil?
      flash[:not_found] = t(:page_not_found)
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