class PeopleController < ApplicationController
  before_filter :authenticate_user!
  def index
    #@people = Person.all
    if params[:typeper]
     @people=Person.where(:typeper=>params[:typeper])
   end
   @typepper=params[:typeper]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  def new
    @person = Person.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  def edit
    @person = Person.find(params[:id])
    mydate= @person.birthday.split("-")
    @person.birthday=Date.strptime("{#{mydate[0]},#{mydate[1]},#{mydate[2]}}","{%Y,%m,%d}")
  end

  def create
    createDate
    @person = Person.new(params[:person])
    respond_to do |format|
      if @person.save
        format.html { redirect_to(@person, :notice => 'Person was successfully created.') }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    createDate
    @person = Person.find(params[:id])
    respond_to do |format|
      if @person.update_attributes(params[:person])
         @user=User.find(@person.user_id)
         UserMailer.registration_confirmation(@user).deliver  
        format.html { redirect_to(@person, :notice => 'Person was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @person = Person.find(params[:id])
    params[:typeper]= @person.typeper
    @person.destroy
    redirect_to(typepeople_path(params[:typeper]))
  end
  
  def createDate
    if params[:person]['birthday(2i)'].length < 2
      mount="0" + params[:person]['birthday(2i)']
    else
      mount=params[:person]['birthday(2i)']
    end
    if params[:person]['birthday(3i)'].length < 2
      day="0" + params[:person]['birthday(3i)']
    else
      day=params[:person]['birthday(3i)']
    end
     params[:person][:birthday]=params[:person]['birthday(1i)']+"-"+mount+"-"+ day
     params[:person].delete('birthday(1i)')
     params[:person].delete('birthday(2i)')
     params[:person].delete('birthday(3i)')
  end

end
