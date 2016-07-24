class AccountsController < ApplicationController
  def show
    @account = Account.new(current_user)
    #ApplicationMailer.user_to_be_approved_email(current_user).deliver_now
  end
end
