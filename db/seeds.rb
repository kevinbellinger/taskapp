
kevin = User.new(
  name:     'Kevin',
  email:    'kevin@example.com',
  password: 'helloworld',

)
kevin.skip_confirmation!
kevin.save


caitlin = User.new(
  name:     'Caitlin',
  email:    'caitlin@example.com',
  password: 'helloworld',

)
caitlin.skip_confirmation!
caitlin.save



# Create Posts
50.times do
  todo = Todo.create(
    user:   kevin,
    description: Faker::Lorem.sentence,
  )

  # set the created_at to a time within the past year
  todo.update_attribute(:created_at, rand(10.minutes .. 1.month).ago)
end
todos = Todo.all

# Create Posts
50.times do
  todo = Todo.create(
    user:   caitlin,
    description: Faker::Lorem.sentence,
  )

  # set the created_at to a time within the past year
  todo.update_attribute(:created_at, rand(10.minutes .. 1.month).ago)
end
todos = Todo.all



