class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in, only: ["new", "create"]

  def index
  end

  def create
    regno = params[:regno]
    name = params[:name]
    user = User.where("regno = ?", regno).exists? ?
      User.where("regno = ?", regno).first :
      User.new(name: name, regno: regno.to_i)
    if (regno.length == 9) && (name.length > 3)
      if user.save
        @current_user = user
        session[:current_user_id] = user.id
        redirect_to(questions_path, notice: "Your'e signed in successfully!")
      else
        flash[:error] = user.errors.full_messages
        redirect_to root_path
      end
    else
      redirect_to(root_path, alert: "Invalid Name or Registration number")
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
