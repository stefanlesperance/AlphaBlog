# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	User.create(username: "Benjamin", email: "benjamin@hotmail.com", password: "password", admin: true)
	User.create(username: "Donald", email: "donald@hotmail.com", password: "password")
	User.create(username: "Pierre", email: "pierre@hotmail.com", password: "password")
	User.create(username: "Churchill", email: "churchill@hotmail.com", password: "password")
	User.create(username: "Stalin", email: "communism@rules.com", password: "testpassword")

	Category.create(name: "Politics")
	Category.create(name: "Sports")
	Category.create(name: "Entertainment")
	Category.create(name: "Business")
	Category.create(name: "History")
	Category.create(name: "Politics")

	Article.create(title: "All About Me.", description: "Why am I perhaps the humblest, greatest man in the world. Part 1/300")