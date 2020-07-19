// -----上までのスクロール----------
$(document).ready(function(){
    $(window).scroll(function() {
        if($(this).scrollTop() > 100) { 
            $(".back-to-top").fadeIn(); 
        } else {
        $(".back-to-top").fadeOut();
        }
    });
    $(".back-to-top").click(function() {
        $("body,html").animate({scrollTop:0},900); 
    });
});

// -----コメント欄へのスクロール----------
// $(function(){
//     function ScrollButton(button, place){
//     var position = $(place).offset().top;
//     $(button).click(function(){
//         $("html,body").animate({
//             scrollTop : position
//         }, {
//             queue : false
//         });
//     });
//     }
//     ScrollButton(".postInfo__commentIcon", ".comments__title");
//     });
