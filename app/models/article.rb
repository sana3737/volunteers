class Article < ActiveRecord::Base
  has_many :article_chapter_blocks

  accepts_nested_attributes_for :article_chapter_blocks, allow_destroy: true

  enum category: %w(etcetera column interview news)
  enum pick_up: {pick_up: true}

  #carrierwave
  mount_uploader :main_image, AriticleImageUploader
end
