class UsersController < ApplicationController
  def index
    @users = if params[:approved] == 'false'
               User.where(approved: false)
             else
               User.all
             end
  end

  def update
    user = User.find(params[:id])
    user.update(approved: true)
    flash[:success] = "#{user.email} approved"

    redirect_to users_path
  end
end
