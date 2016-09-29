class WelcomeController < ApplicationController
  
  def index
    if current_user.admin 
      redirect_to rails_admin_path
    end
    
    @users = User.all
    
  end
  
end
