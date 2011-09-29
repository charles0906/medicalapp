class UsersController < ApplicationController
   before_filter :authenticate_user!

  def index
   # @users = User.where("id NOT IN (?)", current_user.id) # don't display the current user in the users list; go to account management to edit current user details
    @users = User.all()
    #redirect_to users_
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(params[:user])
    if @user.save
      redirect_to(@user, :notice => 'user was successfully created.') 
    else
       render :action => "new" 
    end
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to users_path
    else
      render :action => 'edit'
    end
  end

  def delete
  end

  def destroy
    redirect_to users_path and return if params[:cancel]
    if @user.destroy
      flash[:notice] = "#{ @user.email } deleted."
      redirect_to users_path
    end
  end
  
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
end
