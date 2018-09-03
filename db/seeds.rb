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

test_ids = Test.create!([{ title: 'botany', level: 1, category: categories[0] },
                         { title: 'zoology', level: 2, category: categories[0] },
                         { title: 'mechanics', level: 3, category: categories[3] },
                         { title: 'optics', level: 2, category: categories[3] },
                         { title: 'arithmetic', level: 1, category: categories[2] }]).map(&:id)

qstn_ids = Question.create!([{ body: 'Is a rose a tree?', test_id: test_ids[0] },
                             { body: 'Is a beetle a mammal?', test_id: test_ids[1] },
                             { body: 'Who is the largest animal?', test_id: test_ids[1] },
                             { body: '2 + 3 =', test_id: test_ids[4] },
                             { body: '2 * 6 =', test_id: test_ids[4] }]).map(&:id)

Answer.create!([{ question_id: qstn_ids[0], body: 'No', correct: true },
                { question_id: qstn_ids[0], body: 'Yes' },
                { question_id: qstn_ids[1], body: 'No', correct: true },
                { question_id: qstn_ids[1], body: 'Yes' },
                { question_id: qstn_ids[2], body: 'whale', correct: true },
                { question_id: qstn_ids[2], body: 'elephant' },
                { question_id: qstn_ids[2], body: 'zebra' },
                { question_id: qstn_ids[3], body: '5', correct: true },
                { question_id: qstn_ids[3], body: '23' },
                { question_id: qstn_ids[4], body: '12', correct: true },
                { question_id: qstn_ids[4], body: '26' },
                { question_id: qstn_ids[4], body: '8' }])

user_ids = User.create!([{ name: 'Bobby', login: 'megatron',
                           password: 'bobby123' },
                         { name: 'Mary', login: 'mar_1',
                           password: 'mary2010' },
                         { name: 'John White', login: 'the_best_teacher',
                           password: 'f8rnkallks8' }]).map(&:id)

TestPassage.create!([{ user_id: user_ids[0], test_id: test_ids[0] },
                     { user_id: user_ids[0], test_id: test_ids[2] },
                     { user_id: user_ids[0], test_id: test_ids[3] },
                     { user_id: user_ids[1], test_id: test_ids[1] },
                     { user_id: user_ids[1], test_id: test_ids[2] },
                     { user_id: user_ids[1], test_id: test_ids[3] }])
