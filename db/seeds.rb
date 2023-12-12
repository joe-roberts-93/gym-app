# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Workout.destroy_all
Exercise.destroy_all
Movement.destroy_all
Gym.destroy_all
Goal.destroy_all
puts 'Creating users...'
users = User.create([
                      {
                        first_name: 'John',
                        surname: 'Doe',
                        email: 'john@email.com'
                      },
                      {
                        first_name: 'Jane',
                        surname: 'Doe',
                        email: 'jane@email.com'
                      },
                      {
                        first_name: 'Jack',
                        surname: 'Doe',
                        email: 'jack@email.com'
                      }
                    ])

users.each(&:save)

john = User.find_by(first_name: 'John')
jane = User.find_by(first_name: 'Jane')
jack = User.find_by(first_name: 'Jack')

puts 'Creating gyms...'
gyms = Gym.create([
                    {
                      id: 1,
                      name: 'Gym du Plateau',
                      longitude: 73.5747,
                      latitude: 45.5325
                    },
                    {
                      id: 2,
                      name: 'Nautilus Plus Berri-UQAM',
                      longitude: 73.55843,
                      latitude: 45.51672
                    },
                    {
                      id: 3,
                      name: 'M Fitness St Laurent',
                      longitude: 73.58232,
                      latitude: 45.51791
                    },
                    {
                      id: 4,
                      name: 'Studio Missfit Montreal',
                      longitude: 73.568,
                      latitude: 45.5117
                    },
                    {
                      id: 5,
                      name: 'Club LaCite',
                      longitude: 73.57489,
                      latitude: 45.51031
                    }
                  ])
gyms.each(&:save)
gym_du_plateau = Gym.find_by(name: 'Gym du Plateau')
nautilus_plus = Gym.find_by(name: 'Nautilus Plus Berri-UQAM')
m_fitness = Gym.find_by(name: 'M Fitness St Laurent')
studio_missfit = Gym.find_by(name: 'Studio Missfit Montreal')
club_lacite = Gym.find_by(name: 'Club LaCite')

puts 'Creating movements...'
movements = Movement.create([
                              {
                                name: 'chest press',
                                legs: false,
                                chest: true,
                                core: false,
                                back: false,
                                arms: false
                              },
                              {
                                name: 'leg press',
                                legs: true,
                                chest: false,
                                core: false,
                                back: false,
                                arms: false
                              },
                              {
                                name: 'bent over row',
                                legs: false,
                                chest: false,
                                core: false,
                                back: true,
                                arms: false
                              },
                              {
                                name: 'dumbbell row',
                                legs: false,
                                chest: false,
                                core: false,
                                back: false,
                                arms: true
                              },
                              {
                                name: 'deadlift',
                                legs: true,
                                chest: false,
                                core: false,
                                back: true,
                                arms: false
                              },
                              {
                                name: 'squat',
                                legs: true,
                                chest: false,
                                core: false,
                                back: false,
                                arms: false
                              },
                              {
                                name: 'bench press',
                                legs: false,
                                chest: true,
                                core: false,
                                back: false,
                                arms: false
                              },
                              {
                                name: 'overhead press',
                                legs: false,
                                chest: false,
                                core: false,
                                back: false,
                                arms: true
                              },
                              {
                                name: 'bicep curl',
                                legs: false,
                                chest: false,
                                core: false,
                                back: false,
                                arms: true
                              },
                              {
                                name: 'tricep extension',
                                legs: false,
                                chest: false,
                                core: false,
                                back: false,
                                arms: true
                              },
                              {
                                name: 'sit up',
                                legs: false,
                                chest: false,
                                core: true,
                                back: false,
                                arms: false
                              },
                              {
                                name: 'plank',
                                legs: false,
                                chest: false,
                                core: true,
                                back: false,
                                arms: false
                              },
                              {
                                name: 'push up',
                                legs: false,
                                chest: true,
                                core: false,
                                back: false,
                                arms: true
                              }
                            ])
movements.each(&:save)

chest_press = Movement.find_by(name: 'chest press')
leg_press = Movement.find_by(name: 'leg press')
bent_over_row = Movement.find_by(name: 'bent over row')
dumbbell_row = Movement.find_by(name: 'dumbbell row')
deadlift = Movement.find_by(name: 'deadlift')
squat = Movement.find_by(name: 'squat')
bench_press = Movement.find_by(name: 'bench press')
overhead_press = Movement.find_by(name: 'overhead press')
bicep_curl = Movement.find_by(name: 'bicep curl')
tricep_extension = Movement.find_by(name: 'tricep extension')
sit_up = Movement.find_by(name: 'sit up')
plank = Movement.find_by(name: 'plank')
push_up = Movement.find_by(name: 'push up')

puts 'Creating workouts...'
workouts = Workout.create([
                            {
                              user: john,
                              gym: gym_du_plateau,
                              date: Date.strptime('2021-01-01', '%Y-%m-%d'),
                              time: Time.strptime('12:00:00', '%H:%M:%S')
                            },
                            {
                              user: jane,
                              gym: studio_missfit,
                              date: Date.strptime('2021-01-02', '%Y-%m-%d'),
                              time: Time.strptime('12:00:00', '%H:%M:%S')
                            },
                            {
                              user: jack,
                              gym: nautilus_plus,
                              date: Date.strptime('2021-01-03', '%Y-%m-%d'),
                              time: Time.strptime('12:00:00', '%H:%M:%S')
                            }
                          ])
workouts.each(&:save)
john_workout = Workout.find_by(user_id: john.id)
jane_workout = Workout.find_by(user_id: jane.id)
jack_workout = Workout.find_by(user_id: jack.id)

puts 'Creating goals...'

goals = Goal.create([
                      {
                        user: john,
                        due_date: Date.strptime('2021-12-31', '%Y-%m-%d'),
                        completed: false
                      },
                      {
                        user: jane,
                        due_date: Date.strptime('2021-12-31', '%Y-%m-%d'),
                        completed: false
                      },
                      {
                        user: jack,
                        due_date: Date.strptime('2021-12-31', '%Y-%m-%d'),
                        completed: false
                      }
                    ])
goals.each(&:save)

puts 'Creating workout exercises...'
exercises = Exercise.create([
                              {
                                movement: chest_press,
                                sets: 3,
                                reps: 10,
                                weight: 50,
                                exerciseable: jack_workout
                              },
                              {
                                movement: leg_press,
                                sets: 3,
                                reps: 10,
                                weight: 100,
                                exerciseable: john_workout
                              },
                              {
                                movement: bent_over_row,
                                sets: 3,
                                reps: 10,
                                weight: 30,
                                exerciseable: jane_workout,
                              },
                              {
                                movement: dumbbell_row,
                                sets: 3,
                                reps: 10,
                                weight: 15,
                                exerciseable: jack_workout
                              },
                              {
                                movement: deadlift,
                                sets: 3,
                                reps: 10,
                                weight: 80,
                                exerciseable: john_workout
                              },
                              {
                                movement: squat,
                                sets: 3,
                                reps: 10,
                                weight: 90,
                                exerciseable: jane_workout
                              },
                              {
                                movement: bench_press,
                                sets: 3,
                                reps: 10,
                                weight: 50,
                                exerciseable: jack_workout
                              },
                              {
                                movement: overhead_press,
                                sets: 3,
                                reps: 10,
                                weight: 30,
                                exerciseable: jane_workout
                              },
                              {
                                movement: bicep_curl,
                                sets: 3,
                                reps: 10,
                                weight: 15,
                                exerciseable: jack_workout
                              },
                              {
                                movement: tricep_extension,
                                sets: 3,
                                reps: 10,
                                weight: 15,
                                exerciseable: jack_workout
                              },
                              {
                                movement: sit_up,
                                sets: 3,
                                reps: 10,
                                weight: 0,
                                exerciseable: john_workout
                              },
                              {
                                movement: plank,
                                sets: 3,
                                reps: 10,
                                weight: 0,
                                exerciseable: jane_workout
                              },
                              {
                                movement: push_up,
                                sets: 3,
                                reps: 10,
                                weight: 0,
                                exerciseable: jack_workout
                              }
                            ])
exercises.each(&:save)

puts 'Creating goal exercises...'
john_goal_deadlift = Exercise.create(
  movement: deadlift,
  sets: 3,
  reps: 10,
  weight: 100,
  exerciseable: Goal.find_by(user_id: john.id)
)

john_goal_deadlift.save

jane_goal_bent_over_row = Exercise.create!(
  movement: bent_over_row,
  sets: 3,
  reps: 10,
  weight: 50,
  exerciseable: Goal.find_by(user_id: jane.id)
)
jane_goal_bent_over_row.save

jack_goal_chest_press = Exercise.create!(
  movement: chest_press,
  sets: 3,
  reps: 10,
  weight: 70,
  exerciseable: Goal.find_by(user_id: jack.id)
)
jack_goal_chest_press.save
puts 'Finished!'
