class HomeController < ApplicationController

  def index
        
  end
  
  def addmember_form
      @teams = Team.all 

  end

  def add_member_to_team
    
  end

end
