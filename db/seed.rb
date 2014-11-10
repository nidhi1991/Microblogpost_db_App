require 'active_record'

ActiveRecord::Base.establish_connection({
	database: 'microblogpost_db',
	adapter: 'postgresql',
	host: 'localhost'
})

#Model
require_relative '../models/author.rb'
require_relative '../models/micropost.rb'
require_relative '../models/tag.rb'
require_relative 'author_data.rb'
require_relative 'micropost_data.rb'

# Start from scratch
Author.destroy_all
Micropost.destroy_all
Tag.destroy_all

get_author_data.each do |author|
	Author.create!(author)
end

authors = Author.all
get_micropost_data.each_with_index do |micropost, idx|
	micropost[:author_id] = authors[idx].id
	Micropost.create!(micropost)
end

tag_names = ["Motivation", "happythoughts", "lovelivelaugh", "positivity", "Motivate", "Relationships", "life", "happiness"]
tag_names.each { |tag| Tag.create!(:name => tag) }

Micropost.all.each do |micropost|
	micropost.update_attributes!(:tags => Tag.all)
end
