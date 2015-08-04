//Create a special namesapce for our app called app that is not a part of the global scope
var app = app || {}

$(document).ready(function() {
  //if the user is in /users page, hide the header, footer and basketcount
  if (document.location.pathname == '/users') {
    $('header, footer, .basketcount').hide();
  }

  //do the ajax call for posting signin
  $('#signin').on('click', function() {
    console.log($('input[type=email_address]').val());
    app.ajaxLoginData = {
      url: '/users/signin',
      type: 'POST',
      data: {
        'email_address': $('input[name=email_address]').val(),
        'password': $('input[name=password]').val()
      }
    }
    console.log(app.ajaxLoginData);
    $.ajax(app.ajaxLoginData);
  }); // end on click of sign up

}); // end document ready
