class UsersController < ApplicationController
  def index
  end

  def create
    regno = params[:regno]
    name = params[:name]
    if (regno.length == 9) && (name.length > 3)
      user = User.create(name: name, regno: regno.to_i)
      session[:current_user_id] = user.id
      redirect_to(questions_path, notice: "Your'e signed in successfully!")
    else
      redirect_to(new_user_path, alert: "Invalid Name or regno")
    end
  end

  def new
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to(root_path, notice: "Your'e logged Out successfully!")
  end
end
