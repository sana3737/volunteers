class ArticleChapterBlock < ActiveRecord::Base
  belongs_to :article

  has_many :article_collections

  accepts_nested_attributes_for :article_collections, allow_destroy: true
end
