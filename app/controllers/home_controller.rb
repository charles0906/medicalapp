class HomeController < ApplicationController 
  def index
     if user_signed_in?
           @person = Person.where(:user_id => current_user.id)
           if @person.empty?
             @person = Person.new
             render :action=>'newperson'
           else
             redirect_to appointments_path
            end
     end
  end
  
  def newperson
    @error=params[:error]
    @person=Person.new
  end
  
  def help
  end
end
