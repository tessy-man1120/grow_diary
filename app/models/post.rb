class Post < ApplicationRecord
  validates :title, :text, presence: true
end
