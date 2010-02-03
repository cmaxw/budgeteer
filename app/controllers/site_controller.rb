class SiteController < ApplicationController
  def index
    if current_user
      render :action => 'user_index'
    else
      render :action => 'index'
    end
  end

  def about
  end

end
