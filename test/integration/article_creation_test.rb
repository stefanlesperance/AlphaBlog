require "test_helper"

class ArticleCreationTest < ActionDispatch::IntegrationTest


  setup do
    @user = User.create(username: "johndoe", email: "johndoe@example.com", 
                      password: "password")
  	sign_in_as(@user)
  	#If I wanted to be super sure about this, I'd try and delete it with the same user and see what happened.
  end



  test "get new article form and create article" do

    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
    	post articles_path, params: { article: { title: "spectest", description: "this is a test"}}
    	assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end


end
