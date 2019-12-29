class Photo < ApplicationRecord: :Base
  mount_uploader :picture, PictureUploader 
   end 



