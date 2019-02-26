class Picture
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps

  embedded_in :advert, inverse_of: :pictures

  has_mongoid_attached_file :image,
    path: ':rails_root/public/system/:attachment/:id/:style/:filename',
    url: '/system/:attachment/:id/:style/:filename',
    styles: { small: '200x200>', medium: '400x300>' }

  validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png)
end
