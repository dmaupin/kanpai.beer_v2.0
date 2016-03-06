class Beer < ActiveRecord::Base
	mount_uploader :img, ImgUploader
end
