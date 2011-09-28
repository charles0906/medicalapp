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
  
  def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
  
end
