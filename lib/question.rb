class Question <ActiveRecord::Base
  belongs_to(:quiz)
  has_many(:answers)
  validates(:question, {:presence => true, :uniqueness=> true})
  before_save(:capitalize_question)

  def next_question
    questions_for_this_quiz= self.quiz.questions
    questions_hash ={}

    questions_for_this_quiz.each_with_index do |question, index|
      questions_hash[question] = index
    end
    next_value = questions_hash[self] +1
    questions_hash.key(next_value)
  end

  def last?
    questions_for_this_quiz= self.quiz.questions
    questions_hash ={}
    questions_for_this_quiz.each_with_index do |question, index|

      questions_hash[question] = index

    end

    questions_hash[self] == questions_hash.count - 1

  end

private
  def capitalize_question
    self.question[0] = self.question[0].upcase
    self.question=(question)
  end
end
