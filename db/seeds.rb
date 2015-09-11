# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# environment_seed_file = File.join(Rails.root, 'db', 'seeds', "#{Rails.env}.rb")

@post = Picture.new
@post.uploaded_file = File.new("app/assets/images/seed/maple.jpg")
