class Recurrence < ActiveRecord::Base
  belongs_to :person, :foreign_key => "doctor_id"
  DAYS = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
  
end
