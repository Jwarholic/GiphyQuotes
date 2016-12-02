$(document).ready(function () {
  $('#quote').on('submit', handleTranslateButton);
  $('.searches').on('submit','form', handleNewSearch);
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
    form[0].reset()
  	$('.whole').empty();
    $('.whole').prepend(response);
  })
}

function handleNewSearch(event){
  event.preventDefault();

  var contentArea = $(this).parent().children('section')
  var method = $(this).attr('method');
  var url = $(this).attr('action');

  $.ajax({
    url: url,
    method: method
  }).done(function(response){
    $('article').children('#content').empty();
    contentArea.append(response);
  })

}