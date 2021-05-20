# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

require 'json'
require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/top_rated'

link = URI.open(url).read
movies = JSON.parse(link)

Movie.destroy_all

movies['results'].each do |movie|
  new_movie = Movie.new(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )
  new_movie.save!
  puts "created #{new_movie.title}"
end

puts "created #{Movie.count} movies"
