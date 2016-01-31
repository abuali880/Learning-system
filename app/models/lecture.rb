class Lecture < ActiveRecord::Base
 mount_uploader :my_file, FileUploader
has_many :slides
end
