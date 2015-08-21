class Author < ActiveRecord::Base

	has_many  :documentauthors
	has_many  :documents, :through => :documentauthors
	
end
