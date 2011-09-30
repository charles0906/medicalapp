class Person < ActiveRecord::Base
    belongs_to :user
    has_many :appointments
    has_many :doctors, :through => :appointments
    has_many :patients, :through => :appointments
    has_many :walls
    has_many :recurrences
    validates :user_id, :presence => true, :uniqueness => true
    SEXS = %w[Male Female]
end
