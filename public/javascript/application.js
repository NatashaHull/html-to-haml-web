$(document).ready(function() {
  $('.js-convert').click(function() {
    $('.js-convert').attr('disabled', 'disabled');
    var html = $('.html').val();
    $.post({
      url: '/convert.json',
      data: { html: html },
      dataType: 'json',
      success: function(hamlData) {
        $('.js-convert').removeAttr("disabled");
        $('.haml').text(hamlData.haml);
      },
      error: function(errData) {
        $('.js-convert').removeAttr("disabled");
        errMsg = errData.error;
        $('.haml').text(errMsg);
      }
    });
  }); 
});