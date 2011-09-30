class CreateWalls < ActiveRecord::Migration
  def self.up
    create_table :walls do |t|
      t.integer :doctor_id
      t.date :dateini
      t.time :hourini
      t.date :datefin
      t.time :hourfin
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :walls
  end
end
