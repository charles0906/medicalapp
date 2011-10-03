class AppointmentsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @User= current_user
    if current_user.role.eql? "patient"
      @appointments=Appointment.where(:patient_id => @User.person.id ) 
    elsif current_user.role.eql? "doctor"
      @appointments=Appointment.where(:doctor_id => @User.person.id )
    else
      @appointments = Appointment.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @appointments }
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    @doctor = Person.find(@appointment.doctor_id)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @appointment }
    end
  end

  def new
    @appointment = Appointment.new
     if params[:doctor_id]
       @people = Person.find(params[:doctor_id])
       @patient = Person.where(:user_id=>current_user.id)
       @mypatient=@patient[0]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @appointment }
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def create
    daysoff=["Sunday","Monday" ,"Tuesday", "Wednesday", "Thursday" ,"Friday" ,"Saturday"]
    @appointment = Appointment.new(params[:appointment])
    appointment_verify = Appointment.where(:doctor_id=>@appointment.doctor_id, :dateapp=>@appointment.dateapp,:timeapp=>@appointment.timeapp, :status=>"Scheduled")
    appointment_verify_2 = Appointment.where(:patient_id=>@appointment.patient_id, :dateapp=>@appointment.dateapp,:timeapp=>@appointment.timeapp, :status=>"Scheduled")
    walls = Wall.where(:doctor_id=>@appointment.doctor_id,:dateini=>@appointment.dateapp,:hourini=>@appointment.timeapp)   
    @myappointment=@appointment
    recurrences = Recurrence.where(:doctor_id=>@myappointment.doctor_id,:hourrecu=>@myappointment.timeapp, :day=>daysoff[@myappointment.dateapp.to_time.wday])          
    if walls.size>0
       redirect_to(typepeople_path("doctor"), :notice => 'Dr. '+@appointment.doctor.name+'  '+@appointment.doctor.lastname+' is not avalible for this date.')   
    elsif appointment_verify.size > 0
      redirect_to(typepeople_path("doctor"), :notice => 'Dr. '+@appointment.doctor.name+'  '+@appointment.doctor.lastname+' has already an appointment with the date and hour chosen.')
    elsif appointment_verify_2.size > 0
     redirect_to(typepeople_path("doctor"), :notice => 'You have already an appointment with the date and hour chosen.')
    elsif  @appointment.dateapp < Time.now.to_date+1
      redirect_to(typepeople_path("doctor"), :notice => 'the date can not be less than the date '+(Time.now.to_date+1).to_s)
    elsif recurrences.size>0
      p ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>",recurrences.size
      redirect_to(typepeople_path("doctor"), :notice => 'Dr. '+@appointment.doctor.name+'  '+@appointment.doctor.lastname+' is not avalible for this date. Type: recurrent')
    else
        respond_to do |format| 
         if @appointment.save!
           format.html { redirect_to(@appointment, :notice => 'Appointment was successfully created.') }
           format.xml  { render :xml => @appointment, :status => :created, :location => @appointment }
         else
           format.html { render :action => "new" }
           format.xml  { render :xml => @appointment.errors, :status => :unprocessable_entity }
         end
       end
   end
 end

  def update
    @appointment = Appointment.find(params[:id])
    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to(@appointment, :notice => 'Appointment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @appointment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to(appointments_url) }
      format.xml  { head :ok }
    end
   end
    
    def cancel
      @appointment = Appointment.find(params[:appointment_id])
      @appointment.status="Canceled"
       respond_to do |format|
          if  @appointment.update_attributes(@appointment)
            if current_user.role.eql? "doctor"
              @user=User.find(@appointment.patient.user.id)
              UserMailer.cancellation_of_appointment(@user, @appointment).deliver
            end
            format.html { redirect_to(@appointment, :notice => 'Appointment was canceled.') }
            format.xml  { head :ok }
          else
            format.html { redirect_to(@appointment, :notice => 'Appointment not was canceled.') }
          end
        end
      end
end
