require 'spec_helper'

describe Question do

  it {should belong_to(:quiz)}
  it {should have_many(:answers)}

  it"validates the presence of a question" do
    question = Question.new(question: "")
    expect(question.save).to eq(false)
  end
end
