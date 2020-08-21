class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in, only: ["new", "create"]

  def index
  end

  def create
    regno = params[:regno]
    name = params[:name]
    if (regno.length == 9) && (name.length > 3)
      user = User.create(name: name, regno: regno.to_i)
      @current_user = user
      puts(@current_user.id)
      session[:current_user_id] = user.id
      redirect_to(questions_path, notice: "Your'e signed in successfully!")
    else
      redirect_to(root_path, alert: "Invalid Name or regno")
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
