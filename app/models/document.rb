class Document < ActiveRecord::Base

	has_many  :documentauthors
	has_many  :authors, :through => :documentauthors

	has_many  :documentbooks
	has_many  :books, :through => :documentbooks

	has_many :articles

	belongs_to :prose
	belongs_to :subtopic
	belongs_to :speciality

	mount_uploader :attachment, AttachmentUploader 


	def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    	where("name like ?", "%#{query}%") 
  	end

  	validates_presence_of :number, :name, :description, :autor, :status, :attachment, :prose_id, :subtopic_id, :speciality_id
  	validates :number, :uniqueness => true
  	validates :name, :uniqueness => true
end
