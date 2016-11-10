# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'turbolinks:load', ->
  initMap()
initMap = ->
  address = $('#map').attr('address')
  return false unless address
  geocoder = new google.maps.Geocoder()
  geocoder.geocode {'address':address}, (results, status) ->
    return alert(status) unless status == 'OK'
    map = new google.maps.Map(document.getElementById('map'), {
      zoom:4
      center: results[0].geometry.location
    })
    marker = new google.maps.Marker({
      position: results[0].geometry.location,
      map: map
    })
