class Wall < ActiveRecord::Base
  
   belongs_to :person, :foreign_key => "doctor_id"
   validates :doctor_id, :uniqueness => {:scope => :dateini,:scope=>:hourini}
    
end
