class CreateRecurrences < ActiveRecord::Migration
  def self.up
    create_table :recurrences do |t|
      t.integer :doctor_id
      t.string :day
      t.time :hourrecu

      t.timestamps
    end
  end

  def self.down
    drop_table :recurrences
  end
end
