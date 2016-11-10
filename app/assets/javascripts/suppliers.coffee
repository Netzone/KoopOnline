# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'turbolinks:load', ->
  initMap()
initMap = ->
  address = $('#map').attr('supplier_address')
  store_address = $("#map").attr('store_address')
  store_location = null
  return false unless address && store_address

  geocoder = new google.maps.Geocoder()
  geocoder.geocode {'address':store_address}, (results, status) ->
    return alert(status) unless status == 'OK'
    store_location = results[0].geometry.location

  geocoder.geocode {'address':address}, (results, status) ->
    return alert(status) unless status == 'OK'
    console.log address
    map = new google.maps.Map(document.getElementById('map'), {
      zoom:7
      center: results[0].geometry.location
    })
    marker = new google.maps.Marker({
      position: results[0].geometry.location,
      map: map
    })
    directionsService = new google.maps.DirectionsSerice()
    directionsDisplay = new google.maps.DirectionsRenderer()
    directionsDisplay.setMap(map)
    #calcRoute(results[0].geometry.location, store_location)
    directionsService.route {origin: results[0].geometry.location,destination: store_location, travelMode: 'DRIVING'}, (result, status) ->
      return alert(status) unless status == 'OK'
      directionsDisplay.setDirections(reulst)

