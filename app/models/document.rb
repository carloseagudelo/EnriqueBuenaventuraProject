class Document < ActiveRecord::Base

	has_many  :documentauthors
	has_many  :authors, :through => :documentauthors

	has_many  :documentbooks
	has_many  :books, :through => :documentbooks
	

	belongs_to :prose
	belongs_to :subtopic
	belongs_to :speciality

	mount_uploader :attachment, AttachmentUploader 


	def self.search(search)
	  if search
	    self.where(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    self.all
	  end
	end

end
