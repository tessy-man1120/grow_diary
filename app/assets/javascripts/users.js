$(function () {
  $('.likedPostsText').on('click', () => {
      $('.userPage__contents__right__posts').show();
      $('.userPage__contents__right__likes').hide();
  });
});

$(function () {
  $('.allPostsText').on('click', () => {
      $('.userPage__contents__right__likes').show();
      $('.userPage__contents__right__posts').hide();
  });
});