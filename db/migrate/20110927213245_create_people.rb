class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.integer :user_id
      t.string :name
      t.string :lastname
      t.string :sex
      t.string :birthday
      t.string :cellnumber
      t.string :city
      t.string :address
      t.string :typeper
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
