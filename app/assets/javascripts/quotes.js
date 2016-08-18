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
  var steelWidths = $('#quote_steel_width_id').html();
  var itemSteelGrades = $('#item_steel_grade_id').html();
  var itemSteelWidths = $('#item_steel_width_id').html();

  $('#quote_steel_type_id').change(function(){
    var selectedSteelType = $('#quote_steel_type_id :selected').text();
    var optgroup = "optgroup[label='"+ selectedSteelType + "']";
    var gradeOptions = $(steelGrades).filter(optgroup).html();
    var widthOptions = $(steelWidths).filter(optgroup).html();


    var placeholder = "<option disabled selected value>Please select option</option>"

    $('#quote_steel_grade_id').html(placeholder + gradeOptions);
    $('#quote_steel_width_id').html(placeholder + widthOptions);
  });

  $('#item_steel_type_id').change(function(){
    var selectedSteelType = $('#item_steel_type_id :selected').text();
    var optgroup = "optgroup[label='"+ selectedSteelType + "']";
    var gradeOptions = $(itemSteelGrades).filter(optgroup).html();
    var widthOptions = $(itemSteelWidths).filter(optgroup).html();


    var placeholder = "<option disabled selected value>Please select option</option>"

    $('#item_steel_grade_id').html(placeholder + gradeOptions);
    $('#item_steel_width_id').html(placeholder + widthOptions);
  });

  function updateSteelOptionForm(tableName){
  }

})
