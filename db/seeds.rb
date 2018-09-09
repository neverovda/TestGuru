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
                        password: 'bobby123' , email: 'b@maiil.com'},
                      { name: 'Mary', login: 'mar_1',
                        password: 'mary2010', email: 'm@maiil.com' },
                      { name: 'John White', login: 'the_best_teacher',
                        password: 'f8rnkallks8', email: 'j@maiil.com' }])

tests = Test.create!([{ title: 'botany', level: 1, category: categories[0],
                        author: users[2] },
                      { title: 'zoology', level: 2, category: categories[0],
                        author: users[2] },
                      { title: 'mechanics', level: 3, category: categories[3],
                        author: users[2] },
                      { title: 'optics', level: 2, category: categories[3],
                        author: users[2] },
                      { title: 'arithmetic', level: 1, category: categories[2],
                        author: users[2] }])

questions = Question.create!([{ body: 'Is a rose a tree?', test: tests[0] },
                              { body: 'Is a beetle a mammal?', test: tests[1] },
                              { body: 'Who is the largest animal?', test: tests[1] },
                              { body: '2 + 3 =', test: tests[4] },
                              { body: '2 * 6 =', test: tests[4] }])

Answer.create!([{ question: questions[0], body: 'No', correct: true },
                { question: questions[0], body: 'Yes' },
                { question: questions[1], body: 'No', correct: true },
                { question: questions[1], body: 'Yes' },
                { question: questions[2], body: 'whale', correct: true },
                { question: questions[2], body: 'elephant' },
                { question: questions[2], body: 'zebra' },
                { question: questions[3], body: '5', correct: true },
                { question: questions[3], body: '23' },
                { question: questions[4], body: '12', correct: true },
                { question: questions[4], body: '26' },
                { question: questions[4], body: '8' }])

TestPassage.create!([{ user: users[0], test: tests[0] },
                     { user: users[0], test: tests[2] },
                     { user: users[0], test: tests[3] },
                     { user: users[1], test: tests[1] },
                     { user: users[1], test: tests[2] },
                     { user: users[1], test: tests[3] }])
