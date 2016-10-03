$(document).ready(function() {

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
