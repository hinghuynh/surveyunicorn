User.create(name: "Jean-Luc", email: "picard@federation.gov", password: "3arlGr3y")
User.create(name: "Jonathan", email: "riker@federation.gov", password: "B3ard13!")
User.create(name: "Deanna", email: "humanlady@betazed.us", password: "B1gHa1r4eva")


5.times do
  Survey.create(creator_id: [1,2,3].sample, name: Faker::Name.title)
end

5.times do |s|
  5.times do |q|
    Question.create(survey_id: (s + 1), content: Faker::Company.bs + "?")
    4.times do
      Answer.create(question_id: (q + 1), content: Faker::Hacker.say_soemthing_smart)
    end
  end
end


