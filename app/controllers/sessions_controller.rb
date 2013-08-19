class SessionsController < ApplicationController
  def new
  end

  def create
    account = Account.authenticate params.require(:account).permit(:identifier, :otp)
    if account
      session[:current_account] = account.id
      redirect_to :account
    else
      redirect_to :root, notice: 'Authentication Failed'
    end
  end

  def destroy
    session.delete :current_account
    redirect_to :root
  end
end
