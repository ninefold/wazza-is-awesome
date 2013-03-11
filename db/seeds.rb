# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.delete_all
(1..5).each do |num|
  Post.create(:name => "Post #{num}", :title => "My post number #{num}", 
              :content => "Much ado about nothing for post #{num}")
end
puts "Success: Post seed data loaded"
