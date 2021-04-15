class ArticlesController < ApplicationController
	#This will summon the set_article method before each action i.e. show, edit etc. that requires an article to be set
	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def show
		@article.user = User.last
		#retrieving data from the database using the Article ID - Correct Method Below
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

	def edit
	end

	def create
		#by making it an ainstance variable, we can use it outside.
		@article = Article.new(set_params)
		@article.user = User.last
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

	def update
		#The below bit takes the parameter provided by the Hash, the Article ID, and finds it.
		#Once found, if the button is clicked, it whitelists the Title and Description, and tells them to compare and if need be change it.
		@article.user = User.last
		if @article.update(set_params)
			#Following that, if it is SUCCESSFUL (true/false) it will send a notice and redirect.
			flash[:notice] = "Article was updated successfully"
			#Wonder why redirect_to as opposed to render, but it might be Rails being smart enough to geuss, whereas render is needed for edit.
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		#receiving article id is done via link, because Destroy does not have a view like the others.
		@article.destroy
		redirect_to articles_path
	end

	#Method to replace multiple calls

	private

	#method is locked to within the controller, nothing outside can access it.
	def set_article
		@article = Article.find(params[:id])
	end

	def set_params
		params.require(:article).permit(:title, :description)
	end


end