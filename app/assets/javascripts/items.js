$(document).ready(function() {

  $('.steel-selection').on('change', function(event){
    event.preventDefault();

    var priceKg = $(this).siblings('.price-kg');
    var data = $("#new_quote").serialize();
    var item_data = $(".edit_item").serialize();
    if (!data){
      data = item_data;
    }

    $.get('/quotes/price', data, function(response){
      priceKg.text(response.new_price_kg);
    })
  })
})
