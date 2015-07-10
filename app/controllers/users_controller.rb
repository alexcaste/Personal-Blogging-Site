class UsersController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def edit
    render :edit
  end

  def update
    if @user.update(user_params)
      flash[:notice]="Updated"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :admin)
  end
end
