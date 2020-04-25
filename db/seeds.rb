3.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
  2.times do
    routine = user.routines.create(name: Faker::Relationship.familial)
    routine.exercises.create(name: "exerciseA" ,sets: 2, reps: 3)
    routine.exercises.create(name: "exerciseB", sets: 4, reps: 6)
  end
  user.save
end
