class Cronology < ActiveRecord::Base
  	belongs_to :type
  	belongs_to	:user

	# Album has many photos
	has_many    :photos, :inverse_of => :cronology, :dependent => :destroy
	# enable nested attributes for photos through album class
	accepts_nested_attributes_for :photos, allow_destroy: true 
end
