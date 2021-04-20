class CategoriesController < ApplicationController

	def new
		@category = Category.new
	end

	def index
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
	end


	private

	def category_params
		#Note, the :category - is the top level key. Need to know more on this
		params.require(:category).permit(:name)
	end



end
