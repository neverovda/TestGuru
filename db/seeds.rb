# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.delete_all
Category.create([{id: 1, title: 'biology'}, 
                 {id: 2, title: 'chemistry'}, 
                 {id: 3, title: 'mathematics'}, 
                 {id: 4, title: 'physics'}])

Test.delete_all
Test.create([{id: 1, title: 'botany', level: 1, category_id: 1},
             {id: 2, title: 'zoology', level: 2, category_id: 1},
             {id: 3, title: 'mechanics', level: 3, category_id: 4},
             {id: 4, title: 'optics', level: 2, category_id: 4},
             {id: 5, title: 'arithmetic', level: 1, category_id: 3}])

Question.delete_all
Question.create([{id: 1, body: 'Is a rose a tree?', test_id: 1},
                 {id: 2, body: 'Is a beetle a mammal?', test_id: 2},
                 {id: 3, body: 'Who is the largest animal?', test_id: 2},
                 {id: 4, body: '2 + 3 =', test_id: 5},
                 {id: 5, body: '2 * 6 =', test_id: 5}])

Answer.delete_all
Answer.create([{questions_id: 1, body: 'No', correct: true},
               {questions_id: 1, body: 'Yes'},
               {questions_id: 2, body: 'No', correct: true},
               {questions_id: 2, body: 'Yes'},
               {questions_id: 3, body: 'whale', correct: true},
               {questions_id: 3, body: 'elephant'},
               {questions_id: 3, body: 'zebra'},
               {questions_id: 4, body: '5', correct: true},
               {questions_id: 4, body: '23'},
               {questions_id: 5, body: '12', correct: true},
               {questions_id: 5, body: '26'},
               {questions_id: 5, body: '8'}])


User.delete_all
User.create([{id: 1, name: 'Bobby', login: 'megatron', password: 'bobby123'},
             {id: 2, name: 'Mary', login: 'mar_1', password: 'mary2010'}, 
             {id: 3, name: 'John White', login: 'the_best_teacher', password: 'f8rnkallks8'}])

UserProfile.delete_all
UserProfile.create([{user_id: 1, test_id: 1},{user_id: 1, test_id: 3},
                    {user_id: 1, test_id: 4},{user_id: 2, test_id: 2},
                    {user_id: 2, test_id: 3},{user_id: 2, test_id: 4}])
