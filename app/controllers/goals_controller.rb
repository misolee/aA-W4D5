class GoalsController < ApplicationController
  def new
    
  end
  
  def create
    @goal = Goal.new(goal_params)
    if @goal.save 
      redirect_to user_goal_url(@goal) 
    else 
      flash.now[:errors] = @user.errors.full_messages
      render :new 
    end 
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  def goal_params
    params.require(:goal).permit(:title, :body, :privacy, :goal_date)
  end 
end
