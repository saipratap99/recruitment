class UserQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def getTechQuestions(user)
    user.user_questions.where(type: "tech")
  end
end
