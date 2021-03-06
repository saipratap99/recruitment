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

  def self.user_performances
    all.each do |user|
      tech, non_tech, interaction = 0, 0, 0
      user.user_questions.each do |ques|
        tech += ques.scored if ques.question.ques_type == "tech"
        non_tech += ques.scored if ques.question.ques_type == "non-tech"
        interaction += ques.scored if ques.question.ques_type == "interaction"
      end
      user.tech_marks = tech
      user.non_tech_marks = non_tech
      user.interaction_marks = interaction
      user.save
    end
  end
end
