require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  	def setup
  		@category = Category.create(name: "Sports")
  		@category2 = Category.create(name: "Travel")

  	end

  	test "should show categories listing |" do 
  		get '/categories'
  		#How to check if links exist to the categoriy specific show pages?
  		#We test for the path
  		#This will look for a link that matches the link generated below after the comma.
  		assert_select "a[href=?]", category_path(@category), text: @category.name
  		assert_select "a[href=?]", category_path(@category2), text: @category2.name
 		
  	end


end
