crumb :root do
  link "Top", root_path
end

crumb :mypage do |user|
  if user_signed_in? 
    link "Profile", user_path(current_user)
  else 
    link "Profile", user_path
  parent :root, user
  end
end

crumb :editUser do |user|
  link "Edit Profile", edit_user_registration_path
  parent :mypage, user
end

crumb :newPost do
  link "NewPost", new_post_path
  parent :root
end

crumb :allPost do
  link "AllPost", posts_path
  parent :root
end

crumb :showPost do |post|
  link post.title, post_path(post)
  parent :allPost
end

crumb :editPost do |post|
  link "EditPost", edit_post_path
  parent :showPost, post
end

crumb :searchPost do
  link "Search Result", search_posts_path
  parent :allPost
end

crumb :topLikedPost do
  link "TopLiked", rank_posts_path
  parent :allPost
end

crumb :tags do
  link "Tags", tags_path
  parent :allPost
end

crumb :tagsShowPost do |t|
  link "#{t.name} Posts", tag_path(tag.id)
  parent :tags, t
end
