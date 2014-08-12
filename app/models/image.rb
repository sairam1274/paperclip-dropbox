class Image < ActiveRecord::Base
  has_attached_file :file,
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                    :styles => { :medium => "300x300" , :thumb => "100x100>"},
                    :dropbox_options => {
                        :path => proc { |style| "#{style}/#{id}_#{file.original_filename}"},:unique_filename => true
                    }
  validates_attachment :file, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end


