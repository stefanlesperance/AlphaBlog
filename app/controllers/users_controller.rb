class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]
 
  def new
    @user = User.new
  end

  def show
    #Will grab all articles associated with this individual
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

   def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def destroy
    @user.destroy
    #Now we need to remove the session and the articles.
    #If you leave session[:user_id] set to something deleted, it will throw an error
    # You have options: 1)Clear cookies from broswer, 2) Go to code, in app controller, hardcode it to a different user_id to get back in, then log the user out.
    session[:user_id] = nil
    flash[:notice] = "Accounts and Associated Articles successfully deleted"
    redirect_to articles_path
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You can only edit your own user profile."
      redirect_to @user
    end
  end


end 