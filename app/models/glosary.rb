class Glosary < ActiveRecord::Base

	def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    	where("word like ?", "%#{query}%") 
  	end
end
