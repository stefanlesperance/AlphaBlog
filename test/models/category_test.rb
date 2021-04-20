require "test_helper"

class CategoryTest < ActiveSupport::TestCase

		#First, come up with the feature you want to test.
		#Create an object into its validity
		#Test example below
		test "category should be valid" do
			#Trying to create an object of type category named sports.
			@category = Category.new(name: "Sports")
			#Next comes the assertion.
			assert @category.valid?
		end

		test "name should be present " do
			@category = Category.new(name: "")
			assert_not @category.valid?
		end


		test "name should be unique " do
		end


		test "name should not be too long" do
		end

		test "name should not be too short" do 
		end


end

