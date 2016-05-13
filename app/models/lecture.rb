class Lecture < ActiveRecord::Base
 mount_uploader :my_file, FileUploader
has_many :slides
acts_as_votable
has_many :commentforlectures
def self.search(search)
  if search
    self.where("my_file LIKE ?", "%#{search}%")
  else
    self.all
  end
end
end
