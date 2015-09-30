class Author < ActiveRecord::Base

	has_many  :documentauthors
	has_many  :documents, :through => :documentauthors

	def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    	where("name like ?", "%#{query}%") 
  	end

	
end
