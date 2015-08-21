class Book < ActiveRecord::Base

	has_many  :documentbooks
	has_many  :documents, :through => :documentbooks

end
