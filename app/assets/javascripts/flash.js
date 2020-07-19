// -----簡単ログインモダール----------
$(function () {
  $('.regBtn').click(function(){
      $('#modalArea').fadeIn();
  });
  $('#closeModal , #modalBg').click(function(){
    $('#modalArea').fadeOut();
  });
});
// -----ファッシュメッセージ----------
$(function(){
  setTimeout("$('.notice, .alert').fadeOut('slow')", 1000) 
})
// -----検索ボタンのプルダウンメニュー----------
$(function () {
  $('.headOpen').on('click', () => {
      $('.headMenus').slideToggle();
  });
});
// -----ハンバーガーメニュー----------
$(function () {
  $('.global-nav').on('click', () => {
      $('.menu').slideToggle();
  });
});