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
		#Generates an empty instance of Article 
		@article = Article.new
	end

	def create
		#by making it an ainstance variable, we can use it outside.
		@article = Article.new(params.require(:article).permit(:title, :description))
		if @article.save
			flash[:notice] = "Article was successfully created."
			redirect_to @article
		else
			render 'new'
		end	
		#This redirects to the specific artile. Rails is smart enough to extract the ID
		#renders info to the screen render plain: params[:article]
		#of particular note, the render will show you what is being passed via the params hash
	end

end