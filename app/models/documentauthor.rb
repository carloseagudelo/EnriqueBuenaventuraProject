class Documentauthor < ActiveRecord::Base

	belongs_to :document
	belongs_to :author
	
end
