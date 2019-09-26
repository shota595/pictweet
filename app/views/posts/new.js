$('.form').on("submit", function(e) {
  e.preventDefault();
  var formdata = new FormData($(this).get(0));
  $.ajax({
    type: 'POST',
    url: window.location.href,
    data: formdata,
    dataType: 'json',
    contentType: false,
    processData: false,
    disabled: false
  })
  .done(function(data) {
    buildHTML(data);
    var textField = $('.chat-cntents_type-message_box_message')
    $(textField).val(' ')
    $('.chat-contents_type-message_button').removeAttr("disabled");
    alert('送信が成功しました')
  })
  .fail(function(error) {
    alert('error')
  })
})
