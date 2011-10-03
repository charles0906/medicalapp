class Wall < ActiveRecord::Base
   validates_presence_of :doctor_id, :dateini, :hourini
   validates_uniqueness_of :doctor_id, :scope => [:dateini, :hourini]
   belongs_to :person, :foreign_key => "doctor_id"
   #validates :doctor_id, :uniqueness => {:scope => :dateini,:scope=>:hourini}
   
    
end
