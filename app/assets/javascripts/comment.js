// 使用上コメントが非同期の意味があまりないためコメントアウト

// $(function(){
//   function buildHTML(comment){
//     var html = `<div class="comments__text">
//                   </br>
//                     @
//                     <a class="userComment" href=/users/${comment.user_id}>${comment.user_name}</a>
//                     ：
//                   ${comment.text}
//                   </br>
//                   </br>
//                   ${comment.created_at}
//                   </div>`
//     return html;
//   }
//   $('#new_comment').on('submit', function(e){
//     e.preventDefault();
//     var formData = new FormData(this);
//     var url = $(this).attr("action")
//     $.ajax({
//       url: url,
//       type: "POST",
//       data: formData,
//       dataType: "json",
//       processData: false,
//       contentType: false
//     })
//     .done(function(data){
//       var html = buildHTML(data);
//       $('.comments').append(html);
//       $('.textbox').val('');
//       $('.form__submit').prop('disabled', false);
//     })
//     .fail(function(){
//       alert('error');
//     })
//   })
// });