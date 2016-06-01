/**
 * Created by alberttagirov on 16.05.16.
 */
handler = Gmaps.build('Google');
handler.buildMap({provider: {}, internal: {id: 'map'}}, function () {
    marker = handler.addMarker(
    #{{@hash.to_json}});
handler.bounds.extendWith(marker);
handler.fitMapToBounds();});