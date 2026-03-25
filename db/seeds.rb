# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Book.destroy_all

Book.create! ([
    {
        title: "Milkweed",
        author: "Jerry Spinelli",
        genre: "Historical Fiction",
        rating: 5,
        read_status: "completed",
        published_on: Date.new(2003, 9, 9)
    },
    {
        title: "The Clean Coder: A Code of Conduct for Professional Programmers",
        author: "Robert Cecil Martin",
        genre: "Software Engineering & Management",
        rating: 4.5,
        read_status: "reading",
        published_on: Date.new(2011, 5, 4)
    },
    {
        title:"Finders Keepers",
        author: "Stephen King",
        genre: "Crime Thriller",
        rating: 4,
        read_status: "to_read",
        published_on: Date.new(2015, 6, 2)
    },
])