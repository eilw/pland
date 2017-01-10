class UsersController < ApplicationController
  before_action :authenticate_admin, except: [:welcome]

  def index
    @users = User.all.order(:created_at)
  end

  def update
    user = User.find(params[:id])
    unless user.approved?
      user.update(approved: true)
      UserMailer.approved_user_email(user).deliver_now
      flash[:success] = "#{user.email} approved"
    end

    redirect_to users_path
  end

  def welcome
  end

  private

  def authenticate_admin
    redirect_to account_path unless current_user.admin?
  end
end
