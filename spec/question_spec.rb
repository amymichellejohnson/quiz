require 'spec_helper'

describe Question do

  it {should belong_to(:quiz)}
  it {should have_many(:answers)}

  it"validates the presence of a question" do
    question = Question.new(question: "")
    expect(question.save).to eq(false)
  end

  it "capitalizes the first letter of question leaving other capitalization intact" do
    question = Question.create(question: "what is the capital of Bolivia?")
    expect(question.question).to eq("What is the capital of Bolivia?")
  end

  describe '#next_question' do
    it "retrieves the next question in the collection" do
      quiz = Quiz.create({name: "Biology"})
      question1 = Question.create({question: "What is a cell?", quiz_id: quiz.id})
      question2 = Question.create({question: "What is the ER?"})
      question3 = Question.create({question: "What is ATP?", quiz_id: quiz.id})
      question4 = Question.create({question: "What is a nucleus?", quiz_id: quiz.id})
      expect(question1.next_question).to eq(question3)
    end
  end

  describe '#last?' do
    it "returns whether a question is the last in the collection" do
      quiz = Quiz.create({name: "Biology"})
      question1 = Question.create({question: "What is a cell?", quiz_id: quiz.id})
      question2 = Question.create({question: "What is the ER?"})
      question3 = Question.create({question: "What is ATP?", quiz_id: quiz.id})
      question4 = Question.create({question: "What is a nucleus?", quiz_id: quiz.id})
      expect(question1.last?).to eq(false)
    end
  end
end
