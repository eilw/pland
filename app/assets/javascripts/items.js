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
  var steelGrades = $('#quote_steel_grade_id').html();

  $('#quote_steel_type_id').change(function(){
    var selectedSteelType = $('#quote_steel_type_id :selected').text();
    var optgroup = "optgroup[label='"+ selectedSteelType + "']";
    var gradeOptions = $(steelGrades).filter(optgroup).html();

    var placeholder = "<option disabled selected value>Please select option</option>"
    var gradeOptionsWithPlaceholder = placeholder + gradeOptions


    $('#quote_steel_grade_id').html(gradeOptionsWithPlaceholder);
  });
})
