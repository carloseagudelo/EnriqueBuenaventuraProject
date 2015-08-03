class Document < ActiveRecord::Base

	belongs_to :authors_workeds
	belongs_to :books_workeds
	belongs_to :articles

	mount_uploader :attachment, AttachmentUploader 
end
