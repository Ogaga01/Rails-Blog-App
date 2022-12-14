# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1642978277577-83c6ceac4820?ixlib', bio: 'Teacher from Mexico.')

second_user = User.create(name: 'Lilly', photo: 'https://images.unsplash.comphoto-1495395226200-8fbf6b720b8c?ixlib', bio: 'Teacher from Poland.')

first_post = Post.create(user: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(user: first_user, title: 'Hello', text: 'This is my second post')
third_post = Post.create(user: first_user, title: 'Hello', text: 'This is my third post')
fourth_post = Post.create(user: first_user, title: 'Hello', text: 'This is my fourth post')

Comment.create(post: first_post, user: second_user, text: 'Hi Tom!')
Comment.create(post: first_post, user: second_user, text: 'Hi Tom! How are you?')
Comment.create(post: first_post, user: second_user, text: 'Hi Tom! Welcome')
Comment.create(post: first_post, user: second_user, text: 'see you tomorrrow')
Comment.create(post: first_post, user: first_user, text: 'I\'m new here' )
Comment.create(post: first_post, user: second_user, text: 'I hope you enjoy yourself here!' )
