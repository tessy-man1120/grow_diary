class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true

  # validates :text, format: { with: ^(?!.*script).*$ }, presence: true


  belongs_to :user
  has_many :comments
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations, dependent: :destroy
  has_many :likes, dependent: :destroy

  def self.search(search)
    return Post.all unless search
    Post.where('text LIKE(?)', "%#{search}%")
  end

  mount_uploader :image, AvatarUploader
end
