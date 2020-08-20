$(function(){
  // $('#post_search')[0].reset();

  $('.group-form__action-btn').on('submit',function(){
    $(".main-post-show").prepend("<%= j(render '/posts/show',{comment: @post})%>");
  });
})