// $(function() {
//   function appendPost(post) {
//     var html = 
//       `<div class = "content">
//         <div class = "content__left">
//           <div class = "content__left--image">
//           </div>
//         </div>
//         <div class = "content__right">
//           <div class = "content__right__top">
//             <a href="/post/${post.id}" data-method="get" ></a>
//           </div>
//           <div class = "content__right__bottom">
//           <a href="user/${post.user}" data-method="get">${post.user.nickname}</a>
//           </div>
//           <div class = "content__right__bottom--date">
//             ${post.created_at} 
//           </div>
//         </div>
//       </div>`
//     search_list.append(html);
//   }

//   function appendErrMsgToHTML(msg) {
//     var html = `<div class='name'>${ msg }</div>`
//     search_list.append(html);
//   }
//   $(".search-input").on("keyup", function() {
//     var input = $(".search-input").val();
//     $.ajax({
//       type: 'GET',
//       url: '/posts/search',
//       data: { keyword: input },
//       dataType: 'json'
//     })
//     .done(function(posts) {
//       $(".content").empty();
//       if (posts.length !== 0) {
//         posts.forEach(function(post){
//           appendPost(post);
//         });
//       }
//       else {
//         appendErrMsgToHTML("一致する投稿がありません");
//       }
//     })
//     .fail(function() {
//       alert('error');
//     });
//   });
// });


