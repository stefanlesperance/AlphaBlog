require "test_helper"

class CategoryTest < ActiveSupport::TestCase


	def setup
		# What's written here effectively is run BEFORE each test is run, not just before everything.
		@category = Category.new(name: "Sports")
	end

		#First, come up with the feature you want to test.
		#Create an object into its validity
		#Test example below
		test "category should be valid" do
			#Trying to create an object of type category named sports.
			#@category = Category.new(name: "Sports")
			#Next comes the assertion.
			assert @category.valid?
		end

		test "name should be present " do
			#We reused the @category variable. Why did this work?
			#Because after each test, variables are scrubbed. So in effect, we can reuse it as often as we like
			@category.name =  " "
			assert_not @category.valid?
		end


		test "name should be unique " do
			#For this, we need to save the @category from def setup to the table. 
			#In order for uniqueness to be tested, it must be present in the table first.
			#All table data used here is in the table data only, and scrubbed clean
			@category.save
			@category2 = Category.new(name: "Sports")
			assert_not @category2.valid?
		end


		test "name should not be too long" do
			@category.name = "a" * 26
			assert_not @category.valid?
		end

		test "name should not be too short" do 
			@category.name = "aa"
			assert_not @category.valid?
		end


	end

