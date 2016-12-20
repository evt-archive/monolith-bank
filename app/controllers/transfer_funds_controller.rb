class TransferFundsController < ApplicationController

  def create
    @account = Account.find(params[:account_id])
    recipent = Account.find(params[:recipent_id])

    if TransferFunds.(@account, recipent, params[:amount], params[:memo])
      flash[:notice] = "#{params[:amount]} successfully transfered to #{recipent.name}"
      redirect_to @account
    else
      flash[:notice] = "Insufficient funds"
      render :template => "accounts/show"
    end  
  end  
end