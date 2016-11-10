# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'turbolinks:load', ->
  initMap()
initMap = ->
  address = $('#map').attr('address')
  map = new google.maps.Map($('#map'), {
    zoom:4,
    center: address
  })
  marker = new google.maps.Marker({
    position: address,
    map: map
  })
