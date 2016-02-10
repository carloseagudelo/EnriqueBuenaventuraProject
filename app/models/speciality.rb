class Speciality < ActiveRecord::Base

	has_many :documents

	validates :name, :uniqueness => true
	validates_presence_of :name, :description
	
end
