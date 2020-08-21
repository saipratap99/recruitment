class UserQuestionsController < ApplicationController
  def index
    @questions = @current_user.user_questions
  end
end
