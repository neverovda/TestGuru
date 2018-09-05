# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ title: 'biology' },
                               { title: 'chemistry' },
                               { title: 'mathematics' },
                               { title: 'physics' }])

users = User.create!([{ name: 'Bobby', login: 'megatron',
                        password: 'bobby123' },
                      { name: 'Mary', login: 'mar_1',
                        password: 'mary2010' },
                      { name: 'John White', login: 'the_best_teacher',
                        password: 'f8rnkallks8' }])

tests = Test.create!([{ title: 'botany', level: 1, category: categories[0],
                        user_id: users[2].id },
                      { title: 'zoology', level: 2, category: categories[0],
                        user_id: users[2].id },
                      { title: 'mechanics', level: 3, category: categories[3],
                        user_id: users[2].id },
                      { title: 'optics', level: 2, category: categories[3],
                        user_id: users[2].id },
                      { title: 'arithmetic', level: 1, category: categories[2],
                        user_id: users[2].id }])

questions = Question.create!([{ body: 'Is a rose a tree?', test_id: tests[0].id },
                              { body: 'Is a beetle a mammal?', test_id: tests[1].id },
                              { body: 'Who is the largest animal?', test_id: tests[1].id },
                              { body: '2 + 3 =', test_id: tests[4].id },
                              { body: '2 * 6 =', test_id: tests[4].id }])

Answer.create!([{ question_id: questions[0].id, body: 'No', correct: true },
                { question_id: questions[0].id, body: 'Yes' },
                { question_id: questions[1].id, body: 'No', correct: true },
                { question_id: questions[1].id, body: 'Yes' },
                { question_id: questions[2].id, body: 'whale', correct: true },
                { question_id: questions[2].id, body: 'elephant' },
                { question_id: questions[2].id, body: 'zebra' },
                { question_id: questions[3].id, body: '5', correct: true },
                { question_id: questions[3].id, body: '23' },
                { question_id: questions[4].id, body: '12', correct: true },
                { question_id: questions[4].id, body: '26' },
                { question_id: questions[4].id, body: '8' }])

TestPassage.create!([{ user_id: users[0].id, test_id: tests[0].id },
                     { user_id: users[0].id, test_id: tests[2].id },
                     { user_id: users[0].id, test_id: tests[3].id },
                     { user_id: users[1].id, test_id: tests[1].id },
                     { user_id: users[1].id, test_id: tests[2].id },
                     { user_id: users[1].id, test_id: tests[3].id }])
