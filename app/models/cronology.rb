class Cronology < ActiveRecord::Base
  belongs_to :type

  mount_uploader :url, ImageUploader 
end
