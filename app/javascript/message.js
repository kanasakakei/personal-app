$(function(){
    function add(message){
      if (message.image){
        let html = 
          `<div class="message">
            <div class="message__upper">
              ${message.created_at}
            </div>
            <img src=${message.image}>
            <div class="message__lower">
              <p class="message__lower--content">
                ${message.content}
              </p>
            </div>` 
        return html;
      } else {
        let html = 
        `<div class="message">
          <div class="message__upper">
            ${message.created_at}
          </div>
          <div class="message__lower">
            <p class="message__lower--content">
              ${message.content}
            </p>
          </div>` 
        return html;
      };
    }


  $('#new_message').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = add(data);
      $('.messages')
        .prepend(html)
        .animate({ scrolTop: $('.messages')[0].scrollHeight})
        .sort(function(a,b){
          return(a<b?1:-1)
        });
      $('form')[0].reset();
      $('.main-form__submit').prop("disabled",false);
    })
    .fail(function(){
      alert("メッセージ送信に失敗しました");
    });
  });
});
