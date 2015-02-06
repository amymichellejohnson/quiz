require 'bundler/setup'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

require 'pry'

get '/' do
  @quizzes = Quiz.all
  erb(:index)
end

post '/' do
  name = params.fetch("name")
  Quiz.create(name: name)
  redirect '/'
end

patch '/finished' do
  @answers = Answer.all
  @answers.each do |answer|
    answer.update({chosen: nil})
  end
  redirect ('/')
end


get '/quizzes/:id' do
  id = params.fetch("id")
  @quiz = Quiz.find(id)
  @questions = Question.where({quiz_id: id})
  erb(:add_question)
end

get '/take_quizzes/:id' do
  id = params.fetch("id")
  @quiz = Quiz.find(id)
  @questions = @quiz.questions
  question_id = @questions.minimum(:id)
  if question_id != nil
    @question = Question.find(question_id)
    @answers = Answer.where({question_id: question_id})
  end
  erb(:answer_question)
end

patch '/take_quizzes/questions/:id' do
  question_id= params.fetch("id")
  answer_id = params.fetch("answer_id")
  question = Question.find(question_id)
  answer = Answer.find(answer_id)
  answer.update({chosen: true})

  if question.last?
    redirect ("/finished/questions/#{question_id}")
  end

  quiz_id = question.quiz_id
  @quiz = Quiz.find(quiz_id)
  @questions = question.quiz.questions
  @question = question.next_question
  @answers = @question.answers



  erb(:answer_question)
end

post '/quizzes/:id' do
  id = params.fetch('id')
  @quiz = Quiz.find(id)
  question = params.fetch("question")
  Question.create(question: question, quiz_id: id)
  redirect ("/quizzes/#{@quiz.id}")
end

get '/questions/:id' do
  id = params.fetch("id")
  @question = Question.find(id)
  @answers = Answer.where({question_id: id})
  erb(:add_answer)
end

post '/questions/:id' do
  id = params.fetch("id")
  correct = params.fetch("correct")
  answer = params.fetch("answer")
  Answer.create(answer: answer, question_id: id, correct: correct)
  redirect ("/questions/#{id}")

end

get '/finished/questions/:id' do
  id = params.fetch("id")
  question = Question.find(id)
  @questions= question.quiz.questions
  erb(:results)
end
