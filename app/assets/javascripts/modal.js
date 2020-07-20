// -----簡単ログインモダール----------
$(function () {
  $('.regBtn').click(function(){
      $('#modalArea').fadeIn();
  });
  $('#closeModal , #modalBg').click(function(){
    $('#modalArea').fadeOut();
  });
});
// -----フォロー/フォロワー一覧モダール----------
$(function () {
  $('.followInfo-btn').each(function(){
    $(this).on('click', function(){
    var id = $(this).data('id');
      $('#modalArea[data-id="modal' + id + '"]').fadeIn();
    });
    $('#closeModal , #modalBg').on('click', function(){
      $('#modalArea').fadeOut();
    });
  });
});
// -----グループ参加アラートモダール----------
$(function () {
    $('.groupMenu--join').click(function(){
      $('#modalArea').fadeIn();
  });
  $('#closeModal , #modalBg').click(function(){
    $('#modalArea').fadeOut();
  });
});