# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.create!(
    [
      {
        name: 'seed_test',
        year: '2023',
        description: 'seed_test',
        image_url: 'https://picsum.photos/200',
        is_showing: true,

      },
      {
        name: 'seed_test2',
        year: '2022',
        description: 'seed_test2',
        image_url: 'https://picsum.photos/200',
        is_showing: false,
      }
    ]
  )

  Sheet.create!(
    [
      {
        id: 1,
        column: 1,
        row: 'a'
      },
      {
        id: 2,
        column: 2,
        row: 'a'
      },
      {
        id: 3,
        column: 3,
        row: 'a'
      },
      {
        id: 4,
        column: 4,
        row: 'a'
      },
      {
        id: 5,
        column: 5,
        row: 'a'
      },
      {
        id: 6,
        column: 1,
        row: 'b'
      },
      {
        id: 7,
        column: 2,
        row: 'b'
      },
      {
        id: 8,
        column: 3,
        row: 'b'
      },
      {
        id: 9,
        column: 4,
        row: 'b'
      },
      {
        id: 10,
        column: 5,
        row: 'b'
      },
      {
        id: 11,
        column: 1,
        row: 'c'
      },
      {
        id: 12,
        column: 2,
        row: 'c'
      },
      {
        id: 13,
        column: 3,
        row: 'c'
      },
      {
        id: 14,
        column: 4,
        row: 'c'
      },
      {
        id: 15,
        column: 5,
        row: 'c'
      }
    ]
  )