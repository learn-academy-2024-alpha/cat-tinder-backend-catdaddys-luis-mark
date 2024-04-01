# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
cats = [
    {name:'Chester', age: 6, enjoys: 'Scratching funiture and self grooming.', image:'https://i.pinimg.com/564x/b3/2e/0e/b32e0e8503a5cddc2eb0c33e3ca0355a.jpg'},
    {name:'MackMittens', age: 4, enjoys: 'Dumpster diving and struting down an alley.', image:'https://i.pinimg.com/564x/c3/9a/c5/c39ac5ebf279969584e8e12b7622c556.jpg'},
    {name:'SouthPaw', age: 2, enjoys: 'Chasing mice, killing birds, drinking milk, and playing with yarn.', image:'https://i.pinimg.com/564x/09/65/de/0965de021a8c137d14c031bec640ea3d.jpg'}
]

cats.each do |cat|
    Cat.create(cat)
end
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
