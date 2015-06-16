# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = ["소주","보드카","와인"]

categories.each do |category|
  0.upto(1) do |i|
    p = Post.new
    p.user_id = i + 1
    p.category = category
    p.title = "#{category}#{i} 이름"
    p.content = "#{category}#{i} 후기"
    p.save
  end
end
