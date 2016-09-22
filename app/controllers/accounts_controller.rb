class AccountsController < ApplicationController
  def show
    @account = Account.new(current_user)
  end
end
