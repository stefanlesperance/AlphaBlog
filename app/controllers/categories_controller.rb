class CategoriesController < ApplicationController
	before_action :require_admin, except: [:index, :show]
	def new
		@category = Category.new
	end

	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "Category successfully created"
			redirect_to @category
		else
			render 'new'
		end
	end


	def show
		@category = Category.find(params[:id])
	end


	private

	def category_params
		#Note, the :category - is the top level key. Need to know more on this
		params.require(:category).permit(:name)
	end

	def require_admin
		#If you check for admin without verifying logged in, you will crash.
		if  !(logged_in? && current_user.admin?)
			flash[:danger] = "You cannot create Categories without Administrative privileges"
			redirect_to categories_path
		end
	end
end
