class User < ApplicationRecord
  has_many :user_questions
  validates :name, presence: true, length: { in: 3..50 }
  validates :regno, presence: true, uniqueness: true

  def generateTechQues
    questions = Question.all.where(ques_type: "tech").ids.sample(6)
    questions.each do |ques|
      UserQuestion.create(question_id: ques, user_id: id)
    end
  end

  def generateNonTechQues
    questions = Question.all.where(ques_type: "non-tech").ids.sample(4)
    questions.each do |ques|
      UserQuestion.create(question_id: ques, user_id: id)
    end
  end
end
