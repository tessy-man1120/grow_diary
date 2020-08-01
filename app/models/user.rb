class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :profile, length: { maximum: 200 }
  validates :nickname, length: { maximum: 10 }, presence: true

  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy

  has_many :group_users
  has_many :groups, through: :group_users

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end

  def self.guest
    find_or_create_by!(nickname: "GuestUser", email: "guest@example.com", profile: "MyGrowDiaryへようこそ。\nゲストユーザーとしてアプリの動作をご確認いただけます。\n尚、ゲストユーザーの編集・削除はできません。") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  mount_uploader :image, AvatarUploader
end
