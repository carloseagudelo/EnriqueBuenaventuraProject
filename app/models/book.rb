class Book < ActiveRecord::Base

	has_many  :documentbooks
	has_many  :documents, :through => :documentbooks

	def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    	where("name like ?", "%#{query}%") 
  	end

	validates :name, :uniqueness => true
	validates_presence_of :name, :description

end
