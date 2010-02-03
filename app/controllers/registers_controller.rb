class CheckRegisterController < ApplicationController
  def edit
    @account = current_user.account.find_by_id(params[:id])
  end

  def show
    @account = current_user.account.find_by_id(params[:id])
  end

end
