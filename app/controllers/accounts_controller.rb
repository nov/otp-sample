class AccountsController < ApplicationController
  def show
    unless current_account
      redirect_to :root
    end
  end

  def create
    @account = Account.new params.require(:account).permit(:identifier)
    if @account.save
      session[:current_account] = @account.id
      redirect_to :account
    else
      redirect_to :root
    end
  end
end
