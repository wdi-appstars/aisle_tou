//Create a special namesapce for our app called app that is not a part of the global scope
var app = app || {}

$(document).ready(function() {
  //if the user is in /users page, hide the header, footer and basketcount
  if (document.location.pathname == '/users') {
    $('header, footer, .basketcount').hide();
  }

  //do the ajax call for posting signin
  $('#signin').on('click', function() {
    console.log($('input[name=email_address]').val());
    app.ajaxLoginData = {
      url: '/users/signin',
      type: 'POST',
      data: {
        'email_address': $('input[name=email_address]').val(),
        'password': $('input[name=password]').val()
      },
      success: function() {
        $('.signinmessage').html('Congrats you are logged in!');
        window.location = "/";
      },
      error: function() {
        $('.signinmessage').html('Sorry, your email and/or password do not match our records.');
        $('input[name=email_address]').val('')
        $('input[name=password]').val('')
      }
    }
    console.log(app.ajaxLoginData);
    $.ajax(app.ajaxLoginData);
  }); // end on click of sign in

  //do the ajax call for a new signup
  $('#signup').on('click', function() {
    console.log($('input[name=email_address]').val());
    app.ajaxLoginData = {
      url: '/users/signup',
      type: 'POST',
      data: {
        'email_address': $('input[name=email_address]').val(),
        'password': $('input[name=password]').val()
      },
      success: function() {
        $('.signupmessage').html('Congrats you are registered');
        window.location = "/";
      },
      error: function() {
        $('.signupmessage').html('Sorry, that email already exists.');
        $('input[name=email_address]').val('')
        $('input[name=password]').val('')

      }
    }
    $.ajax(app.ajaxLoginData);
  });// end on click of sign up
}); // end document ready
