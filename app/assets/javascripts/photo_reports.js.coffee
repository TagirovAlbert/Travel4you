# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#photo_report_region_id').hide()
  $('#photo_report_city_id').hide()
  regions = $('#photo_report_region_id').html()
  cities = $('#photo_report_city_id').html()
  $('#photo_report_country_id').change ->
    country = $('#photo_report_country_id :selected').text()
    options = $(regions).filter("optgroup[label='#{country}']").html()
    if options
      $('#photo_report_region_id').html(options)
      console.log(options)
      $('#photo_report_region_id').change ->
        region = $('#photo_report_region_id :selected').text()
        options_t = $(cities).filter("optgroup[label = '#{region}']").html()
        if options_t
          $('#photo_report_city_id').html(options_t)
          $('#photo_report_city_id').show()
        else
          $('#photo_report_city_id').empty()
          $('#photo_report_city_id').hide()
      $('#photo_report_region_id').show()

    else
      $('#photo_report_region_id').empty()
      $('#photo_report_region_id').hide()
      $('#photo_report_city_id').empty()
      $('#photo_report_city_id').hide()

