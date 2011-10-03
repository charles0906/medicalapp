class RecurrencesController < ApplicationController

  def index
     if current_user.role.eql? "doctor"
        @recurrences = Recurrence.where(:doctor_id=>current_user.person.id)
     elsif current_user.role.eql? "admin"
        @recurrences = Recurrence.all
     end
     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @recurrences }
     end
   end

  def show
    @recurrence = Recurrence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recurrence }
    end
  end

  def new
    @recurrence = Recurrence.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recurrence }
    end
  end

  def edit
    @recurrence = Recurrence.find(params[:id])
  end

  def create
    @recurrence = Recurrence.new(params[:recurrence])
    #@recurrence.hourrecu=params[:hourrecu].to_time.hour
    @recurrence.doctor_id=current_user.person.id
    respond_to do |format|
      if @recurrence.save
        format.html { redirect_to(@recurrence, :notice => 'Recurrence was successfully created.') }
        format.xml  { render :xml => @recurrence, :status => :created, :location => @recurrence }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recurrence.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @recurrence = Recurrence.find(params[:id])
    @recurrence.doctor_id=current_user.person.id
    respond_to do |format|
      if @recurrence.update_attributes(params[:recurrence])
        format.html { redirect_to(@recurrence, :notice => 'Recurrence was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recurrence.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @recurrence = Recurrence.find(params[:id])
    @recurrence.destroy

    respond_to do |format|
      format.html { redirect_to(recurrences_url) }
      format.xml  { head :ok }
    end
  end
end
