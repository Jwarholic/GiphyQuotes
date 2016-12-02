$(document).ready(function () {
  $('#quote').on('submit', handleTranslateButton);
});


function handleTranslateButton(event){
  event.preventDefault()

  var form = $(this);
  var method = $(this).attr('method');
  var url = $(this).attr('action');
  var data = $(this).serialize()

  $.ajax({
    url: url,
    method: method,
    data: data,
  }).done(function(response){
  	$('.Hot-Quote').empty();
    $('.Hot-Quote').prepend(response);
  })
}