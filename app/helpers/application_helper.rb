module ApplicationHelper
  def personExist?
    if user_signed_in?
         @myperson = Person.where(:user_id => current_user.id)
         if @myperson .empty?
            return false
         else
           return true
         end
     end
  end
end
