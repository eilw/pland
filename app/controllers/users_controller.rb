class UsersController < ApplicationController
  before_action :authenticate_admin, except: [:welcome]

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

  def welcome
  end

  private

  def authenticate_admin
    redirect_to account_path unless current_user.admin?
  end
end
