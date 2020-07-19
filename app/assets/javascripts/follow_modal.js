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