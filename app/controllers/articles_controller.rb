class ArticlesController < ApplicationController

	def show
		#retrieving data from the database using the Article ID - Correct Method Below
		@article = Article.find(params[:id])
		#incorrect method below
		#article = Article.find(params[:id]) - Params is a hash, and will nab it from the HTML(?)
	end

	def index
		@articles = Article.all	
	end

	def new
	end

	def create
		render plain: params[:article]
	end

end