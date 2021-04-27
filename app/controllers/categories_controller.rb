class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update]
	before_action :require_admin, except: [:index, :show, :edit]

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

	def edit
	end

	def update
		if @category.update(category_params)
	      flash[:notice] = "Category successfully updated"
	      redirect_to @category
	    else
      		render 'edit'
    	end
	end

	 # def destroy
	 #    @category.destroy
	 #    flash[:notice] = "Category has been destroyed"
	 #    redirect_to articles_path
 	#  end



	def show
		@articles = @category.articles.paginate(page: params[:page], per_page: 5)
	end


	private

	def category_params
		#Note, the :category - is the top level key. Need to know more on this
		params.require(:category).permit(:name)
	end

	def set_category
		@category = Category.find(params[:id])
	end

	def require_admin
		#If you check for admin without verifying logged in, you will crash.
		if  !(logged_in? && current_user.admin?)
			flash[:danger] = "You cannot create Categories without Administrative privileges"
			redirect_to categories_path
		end
	end
end
