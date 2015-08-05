//Create a special namesapce for our app called app that is not a part of the global scope
var app = app || {}

$(document).ready(function() {
  //if the user is in /users page, hide the header, footer and basketcount
  if (document.location.pathname == '/users') {
    $('header, footer, .basketcount').hide();
  }

  //get the user_id of logged in user if logged in
  app.current_user_id = $('.basketcount button').data('userid');

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

  //do the ajax call for adding a new food item to the basket
  $('li.fooditem').on('click', function() {
      app.ajaxShoppingData = {
        url: '/basket',
        type: 'POST',
        data: {
          food_id: $(this).data('foodid'),
          basket_id: $('input[name=basket_id]').attr('value')
        },
        success: function () {
          get_basket_count(app.current_user_id)
        },
        error: function () {
          //sorry it failed
        }
      }
      console.log(app.ajaxShoppingData);
      $.ajax(app.ajaxShoppingData);
  });

  //on click of a basket remove button, reduce item count via ajax ad recalculate total price on the fly
  $('.removebutton').on('click', function() {
    $this = $(this);
    $this_item = $this.parent();
    app.food_id_to_remove = $(this).data('foodid');
    $this_quantity = $('#item' + app.food_id_to_remove);
    $this_price = $this_quantity.siblings('.price');
    $.ajax({
      url: '/basket/remove',
      type: 'POST',
      data: {
        food_id: app.food_id_to_remove
      },
      success: function() {
        console.log('success, success!  I have the money to save the goon docks!');
        quantity = $this_quantity.html().split('')
        quantity.shift();
        quantity = quantity.join('') - 1;
        $this_quantity.html('x' + quantity.toString());
        if (quantity <= 0) {
          $this_item.hide();
        }
        $('.basketcount button').html(parseInt($('.basketcount button').html()) - 1);
        unit_price = $this.data('price');
        item_total = $this_price.html().split('');
        item_total.shift();
        item_total = item_total.join('');
        item_total -= unit_price;
        item_total = parseFloat(item_total.toFixed(2));
        $this_price.html('$' + item_total);

        current_total = $('.totalprice').html().split('');
        current_total.shift();
        current_total = current_total.join('');
        console.log('current_total=' + current_total + ' unit_price=' + unit_price);
        current_total -= unit_price;
        current_total = parseFloat(current_total.toFixed(2));
        $('.totalprice').html('$' + current_total);
      }
    });
  });

  //display the correct view title according to what page the user is currently looking at
  app.paths = {
    '/': 'Home',
    '/shop': 'Shop',
    '/basket': 'Basket',
    '/delivery': 'Delivery',
    '/about': 'About'
  }
  $('header h1').html(app.paths[window.location.pathname]);

  //on click of global basket button, redirect to basket
  $('.basketcount button').on('click', function() {
    window.location = '/basket'
  });

  //reflect the correct basketcount on the button
  get_basket_count(app.current_user_id)

}); // end document ready

function get_basket_count(user_id) {
  $.ajax({
    url: '/users/api/user/' + user_id + '/basketcount',
    dataType: 'json',
    type: 'GET',
    success: function(data) {
      $('.basketcount button').html(data.basket_count);
    },
    error: function(err) {
      $('.basketcount button').html(0);
    }
  });
}
