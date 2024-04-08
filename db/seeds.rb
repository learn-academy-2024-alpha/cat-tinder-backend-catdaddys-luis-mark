# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
cats = [
    {
        name: 'Chester',
        age: 6,
        enjoys: 'Scratching funiture and self grooming.',
        image: 'https://i.pinimg.com/564x/b3/2e/0e/b32e0e8503a5cddc2eb0c33e3ca0355a.jpg'
    },
    {
        name: 'MackMittens',
        age: 4,
        enjoys: 'Dumpster diving and struting down an alley.',
        image: 'https://i.pinimg.com/564x/c3/9a/c5/c39ac5ebf279969584e8e12b7622c556.jpg'
    },
    {
        name: 'SouthPaw',
        age: 2,
        enjoys: 'Chasing mice, killing birds, drinking milk, and playing with yarn.',
        image: 'https://i.pinimg.com/564x/09/65/de/0965de021a8c137d14c031bec640ea3d.jpg'
    },
    {
        name: 'Whiskers',
        age: 9,
        enjoys: 'Curiosity hasnt gotten me yet.',
        image: 'https://i.pinimg.com/474x/08/15/db/0815db6e2e1ac7407c3cf85939c5ef47.jpg'
    },
    {
        name: 'Captain Catnip',
        age: 5,
        enjoys: 'lounging, ignoring the human.',
        image: 'https://i.pinimg.com/474x/1c/83/df/1c83df1c7feabd4fe0c1195eedc85444.jpg'
    },
    {
        name: 'Leslie Meow',
        age: 2,
        enjoys: 'getting stuck in a tree and freaking out my owners.',
        image: 'https://i.pinimg.com/474x/df/85/d1/df85d104c59cb9fb26c31502a9ef3e75.jpg'
    },
    {
        name: 'Seymour Scruffs',
        age: 7,
        enjoys: 'running an underground mice extermination service.',
        image: 'https://i.pinimg.com/474x/ec/5a/69/ec5a6992dec2d5539838cb970e624f9a.jpg'
    },
    {
        name: 'Tiger',
        age: 4,
        enjoys: 'Meow mix and chill.',
        image: 'https://i.pinimg.com/474x/67/ea/22/67ea22b1de3ebb89bde365c07dc19977.jpg'
    },
    {
        name: 'Paulie Paws',
        age: 2,
        enjoys: 'Lead singer of The Fur Ballers. Check us out.',
        image: 'https://i.pinimg.com/474x/37/ba/2c/37ba2cd601ebcb62ce1a0e574f0c5906.jpg'
    },
]

cats.each do |cat|
    Cat.create(cat)
end
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
