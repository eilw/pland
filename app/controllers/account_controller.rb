class AccountController < ApplicationController

  def show
    @account = Account.find_by_user_id(current_user.id)
  end
end
