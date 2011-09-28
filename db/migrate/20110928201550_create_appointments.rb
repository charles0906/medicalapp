class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.date :dateapp
      t.time :timeapp
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
