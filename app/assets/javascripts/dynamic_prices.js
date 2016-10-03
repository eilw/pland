$(document).ready(function() {

  $('.steel-selection').on('change', function(event){
    event.preventDefault();

    var priceKg = $('.active > .price-cell > .price-kg');
    var priceItem = $('.active > .price-cell > .price-item');
    var data = $('.new_quote').serialize();
    var item_data = $('.edit_item').serialize();
    if (!data){
      data = item_data;
    }

    $.get('/quotes/price', data, function(response){
      if (parseFloat(response.new_price_kg) > 0 ) {
        priceKg.html('$' + response.new_price_kg);
      }
      if (parseFloat(response.new_item_cost) > 0 ) {
        priceItem.html('$' + parseFloat(response.new_item_cost).toFixed(2));
      }
    });
  });
});
