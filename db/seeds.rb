# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'John', photo: 'https://images.unspl
ash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG9
0by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80', bio: 'Teacher from 
Mexico.', email: 'admin1@admin.com', password: 'password')

second_user = User.create(name: 'James', photo: 'https://images.unsplash.com/photo-1508922088233-a07c9cc6972f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', bio: 'Teacher from Poland.', email: 'admin2@admin.com', password: 'password')

first_post = Post.create(author: User.first, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: User.second, title: 'This is my second post!', text: 'Second comment')
third_post = Post.create(author: User.first, title: 'Hello everyone!', text: 'I am new on this')
fourth_post = Post.create(author: User.second, title: 'Microverse', text: 'This is very cool')

Comment.create(post: first_post, author: User.second, text: 'Hi Tom!')
Comment.create(post: first_post, author: User.first, text: 'Hi Lilly, How was your day?')
Comment.create(post: first_post, author: User.second, text: 'I am very well, thank you')
Comment.create(post: second_post, author: User.second, text: 'Congrats for your second post')
Comment.create(post: third_post, author: User.first, text: 'Welcome to my new blog!')
Comment.create(post: fourth_post, author: User.first, text: 'You are right, it is very cool')