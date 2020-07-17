crumb :root do
  link "Top", root_path
end

crumb :mypage do
  link "Profiles", user_path(current_user)
  parent :root
end

crumb :editUser do |user|
  link "EditProfile", edit_user_registration_path
  parent :mypage, user
end

crumb :newPost do |post|
  link "NewPost", new_post_path
  parent :root, post
end

crumb :allPost do |post|
  link "AllPost", posts_path
  parent :root, post
end

crumb :topLikedPost do |post|
  link "TopLiked", rank_posts_path
  parent :allPost, post
end

crumb :tags do |post|
  link "Tags", rank_posts_path
  parent :allPost, post
end

crumb :tagsShowPost do |post|
  link "TagPosts", tag_path(tag.id)
  parent :tags, post
end
