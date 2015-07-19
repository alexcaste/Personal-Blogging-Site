# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

alex = User.create(first_name: 'The', last_name: 'Master', email: 'Master@master.com', password: 'password', admin: true)
joe = User.create(first_name: 'Joe', last_name: 'Blow', email: 'joe@joe.com', password: 'password', admin: false)
ruby = Skill.create(name: 'Ruby', description: 'Experience building apps using Ruby')
ember = Skill.create(name: 'EmberCLI', description: 'Experience building apps using EmberCLI')
Project.create(name: 'Terminal Hair', description: 'Funny site where users can post and discuss their orgaincally grown artisinal beards.', link: 'http://artist-chipmunk-17212.bitballoon.com/', skill_id: ember.id)
Project.create(name: 'Clinical Trial Scheduler', description: 'A app for clinical trial scheduling designed so that patients, doctors and trials are not conflicting.', link: 'http://scheduling-app.herokuapp.com/', skill_id: ruby.id)
post1 = Post.create(title: 'I am pissed!', body: "you don't then you need to rethink.", user_id: alex.id)
post2 = Post.create(title: 'Code Review Today', body: "Not feeling at all prepared for this code review since the material we have gone over was sort of crammed into a little space of time", user_id: alex.id)
post3 = Post.create(title: 'The Pain', body: "Hello world I'm Joe!", user_id: joe.id)
post4 = Post.create(title: 'Yolo', body: "Just scream YOLO at the police when they arrest you.  They'll let you go then.", user_id: joe.id)
Comment.create(body: "Wtf?!", post_id: post4.id, user_id: alex.id)
Comment.create(body: "True Story, bro!", post_id: post4.id, user_id: joe.id)
Comment.create(body: "Hi Joe", post_id: post3.id, user_id: alex.id)
Comment.create(body: "Wassup", post_id: post3.id, user_id: joe.id)
Comment.create(body: "Stop yer whining", post_id: post2.id, user_id: joe.id)
Comment.create(body: "Shut up!", post_id: post2.id, user_id: alex.id)
Comment.create(body: "FIRST!", post_id: post1.id, user_id: joe.id)
Comment.create(body: "face palm", post_id: post1.id, user_id: alex.id)
