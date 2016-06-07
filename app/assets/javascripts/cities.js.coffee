# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#place_region_id').hide()
  $('#place_city_id').hide()
  regions = $('#place_region_id').html()
  cities = $('#place_city_id').html()
  $('#place_country_id').change ->
    country = $('#place_country_id :selected').text()
    options = $(regions).filter("optgroup[label='#{country}']").html()
    if options
      $('#place_region_id').html(options)
      console.log(options)
      $('#place_region_id').change ->
        region = $('#place_region_id :selected').text()
        options_t = $(cities).filter("optgroup[label = '#{region}']").html()
        if options_t
          $('#place_city_id').html(options_t)
          $('#place_city_id').show()
        else
          $('#place_city_id').empty()
          $('#place_city_id').hide()
      $('#place_region_id').show()

    else
      $('#place_region_id').empty()
      $('#place_region_id').hide()
      $('#place_city_id').empty()
      $('#place_city_id').hide()

