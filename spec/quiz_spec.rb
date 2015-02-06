require 'spec_helper'

describe Quiz do

  it {should have_many(:questions)}

  it "validates the presence of a quiz name" do
    quiz = Quiz.new(name: "")
    expect(quiz.save).to eq(false)
  end

  it "capitalizes the first letter of the quiz name" do
    quiz = Quiz.create(name: "biology")
    expect(quiz.name).to eq("Biology")
  
  end

end
