class Recurrence < ActiveRecord::Base
  validates_presence_of :doctor_id, :day, :hourrecu
  validates_uniqueness_of :doctor_id, :scope => [:day, :hourrecu]
  belongs_to :person, :foreign_key => "doctor_id"
  DAYS = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
  
end
