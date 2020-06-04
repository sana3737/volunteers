class ArticleCollection < ActiveRecord::Base
  belongs_to :article_chapter_block

  #carrierwave
  mount_uploader :chapter_image, AriticleImageUploader

  enum type_code: %w(image text link)
end
