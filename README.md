# aisle_tou app
Aisle Tou is a personalized internet grocery shopping app that delivers your groceries to your home or bussiness.

#### App Technologies
1. Sinatra
2. Ruby
3. Javascript
4. jQuery
5. ActiveRecord

#### How to install and Run
1. Got to GitHub and clone 'aisle_tou' repository
2. 'bundle' the GEMfile
3. Run the migration.sql file in Postgress to generate the rquired databases
4. Run 'bundle exec rackup'
5. Browse to localhost:9292

#### Page Views
![Images](/designs/IOS_Views/index_welcome_page.png)
![Images](/designs/IOS_Views/home_dashboard_page.png)
![Images](/designs/IOS_Views/Basket_Shop_Page.png)
![Images](/designs/IOS_Views/scheduled_delivery_page.png)
![Images](/designs/IOS_Views/delivery_success_page.png)


#### PHoto
![Images](/public/images/groceries-bg.jpg)

### API Call

```js
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
      quantity = $this_quantity.html().split('')
      quantity.shift();
      quantity = quantity.join('') - 1;
      $this_quantity.html('x' + quantity.toString());
      if (quantity <= 0) {
        $this_item.detach();
      }
      if ($('.basketitem').length == 0) {
        $('#basket .message').html('You have no items in your basket');
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
```

Challenges:  Continuity of the back-end and front-end technologies for a better user experience.

Version 2.0 will have nutrition information for specific food items. Plus health indicators for users who suffer from certain chronic health issues like hypertension or diabeties). Also, a smarter food restock algorithm. API for specific grocery stores.
