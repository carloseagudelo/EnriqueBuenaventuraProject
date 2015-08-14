class Document < ActiveRecord::Base

	belongs_to :authors_workeds
	belongs_to :books_workeds
	belongs_to :articles

	belongs_to :prose
	belongs_to :subtopic
	belongs_to :speciality

	mount_uploader :attachment, AttachmentUploader 
end
