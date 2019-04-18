require 'faker'

# Make questions
50.times do
  Question.create(
    title: "#{Faker::Hipster.sentence(5, true)}?",
    description: "#{Faker::ChuckNorris.unique.fact}?"
  )
end

# Make answers
100.times do
  Answer.create(
    answer: "#{Faker::Hipster.sentence(10, true)}",
    question_id: Faker::Number.between(1, 50)
  )
end
