class UserMailer < ActionMailer::Base
  #default :from => "info@medicalapp.com"  
  def registration_confirmation(user)  
    mail(:to => user.email, :subject => "Data update",:from => "info@medicalapp.com")  
  end
  
  def cancellation_of_appointment(user, appointment)
    @appointment = appointment
    mail(:to => user.email, :subject => "Cancellation of appointment",:from => "info@medicalapp.com")  
  end
end
