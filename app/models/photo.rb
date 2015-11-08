class Photo < ActiveRecord::Base
	#photo belongs to album
	belongs_to	:cronology

	#validations
	validates 	:cronology, presence: true
	# Photo uploader using carrierwave
    mount_uploader :image, ImageUploader
end
