class Appointment < ActiveRecord::Base
   belongs_to :doctor, :foreign_key => "doctor_id",:class_name => "Person"
   belongs_to :patient, :foreign_key => "patient_id",:class_name => "Person"
   #validates :doctor_id, :uniqueness => {:scope => :dateapp,:scope=>:timeapp}
   HOURS = %w[08 09 10 11 14 15 16 17]
   MINUTES= %w[08 09 10 11 14 15 16 17]
end