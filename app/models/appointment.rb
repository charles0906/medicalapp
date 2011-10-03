class Appointment < ActiveRecord::Base
   belongs_to :doctor, :foreign_key => "doctor_id",:class_name => "Person"
   belongs_to :patient, :foreign_key => "patient_id",:class_name => "Person"
   validates_uniqueness_of :doctor_id, :scope => [:dateapp, :timeapp]
   validates_presence_of :doctor_id, :patient_id,:dateapp, :timeapp
   
   #validates :doctor_id, :uniqueness => {:scope => :dateapp,:scope=>:timeapp}

end