//Create a special namesapce for our app called app that is not a part of the global scope
var app = app || {}

$(document).ready(function() {
  //if the user is in /users page, hide the header, footer and basketcount
  if (document.location.pathname == '/users') {
    $('header, footer, .basketcount').hide();
  }
});
