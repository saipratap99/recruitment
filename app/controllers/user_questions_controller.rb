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

  def calculate_score
    total = 0
    score = params[:marks].to_i
    @ques = @current_user.user_questions.order(id: :asc).last
    @ques.scored = score.to_i
    @ques.save
    @current_user.user_questions.each { |q| total += q.scored }
    @current_user.marks = total
    @current_user.save
    respond_to do |format|
      format.html { redirect_to("/user_questions/index", notice: "Response submited!") }
      format.js
    end
  end
end
