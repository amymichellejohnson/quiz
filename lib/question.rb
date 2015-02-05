class Question <ActiveRecord::Base
  belongs_to(:quiz)
  has_many(:answers)
  validates(:question, :presence => true)
  before_save(:capitalize_question)


private
  def capitalize_question
    self.question=(question.downcase.capitalize)
  end
end
