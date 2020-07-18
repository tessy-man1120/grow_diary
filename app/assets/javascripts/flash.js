$(function(){
  setTimeout("$('.notice, .alert').fadeOut('slow')", 1000) 
})
// 検索ボタンのプルダウンメニュー
$(function () {
  $('.headOpen').on('click', () => {
      $('.headMenus').slideToggle();
  });
});

// ハンバーガーメニュー
$(function () {
  $('.global-nav').on('click', () => {
      $('.menu').slideToggle();
  });
});