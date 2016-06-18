jQuery ->
  $('#region_id').hide()
  regions = $('#region_id').html()
  $('#country_id').change ->
    country = $('#country_id :selected').text()
    options = $(regions).filter("optgroup[label='#{country}']").html()
    if options
      $('#region_id').html(options)
      $('#region_id').show()

    else
      $('#region_id').empty()
      $('#region_id').hide()
