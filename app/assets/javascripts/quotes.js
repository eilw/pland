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

  var steelGrades = $('#quote_steel_grade_id').html();
  var steelWidths = $('#quote_steel_width_id').html();
  var itemSteelGrades = $('#item_steel_grade_id').html();
  var itemSteelWidths = $('#item_steel_width_id').html();

  $('#quote_steel_type_id').change(function(){
    var selectedSteelType = $('#quote_steel_type_id :selected').text();
    var optgroup = "optgroup[label='"+ selectedSteelType + "']";
    var gradeOptions = $(steelGrades).filter(optgroup).html();
    var widthOptions = $(steelWidths).filter(optgroup).html();

    var placeholder = '<option disabled selected value>Seleccionar</option>';

    $('#quote_steel_grade_id').html(placeholder + gradeOptions);
    $('#quote_steel_width_id').html(placeholder + widthOptions);
  });

  $('#item_steel_type_id').change(function(){
    var selectedSteelType = $('#item_steel_type_id :selected').text();
    var optgroup = "optgroup[label='"+ selectedSteelType + "']";
    var gradeOptions = $(itemSteelGrades).filter(optgroup).html();
    var widthOptions = $(itemSteelWidths).filter(optgroup).html();

    var placeholder = '<option disabled selected value>Seleccionar</option>';

    $('#item_steel_grade_id').html(placeholder + gradeOptions);
    $('#item_steel_width_id').html(placeholder + widthOptions);
  });
});
