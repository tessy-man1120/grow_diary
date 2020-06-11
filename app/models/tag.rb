class Tag < ApplicationRecord
  has_many :article_tag_relations, dependent: :destroy

  has_many :articles, through: :post_tag_relations, dependent: :destroy
end
