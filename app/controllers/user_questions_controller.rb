class UserQuestionsController < ApplicationController
  def index
    # @tech_questions = UserQuestion.getTechQuestions(@current_user)
    # @non_tech_questions = UserQuestion.getNonTechQuestions(@current_user)
    @questions = @current_user.user_questions.order(id: :asc)
  end

  def save_score
    id = params[:id]
    score = params[:score]
    @ques = UserQuestion.find(id)
    @ques.scored = score.to_i
    @ques.save
    respond_to do |format|
      format.html { redirect_to("/user_questions/index", notice: "Response submited!") }
      format.js
    end
  end
end
