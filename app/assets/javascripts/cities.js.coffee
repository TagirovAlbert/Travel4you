# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#city_region_id').hide()
  regions = $('#city_region_id').html()
  $('#city_country_id').change ->
    country = $('#city_country_id :selected').text()
    options = $(regions).filter("optgroup[label='#{country}']").html()
    if options
      $('#city_region_id').html(options)
      $('#city_region_id').show()
    else
      $('#city_region_id').empty()
      $('#city_region_id').hide()