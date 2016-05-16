/**
 * Created by alberttagirov on 16.05.16.
 */
handler = Gmaps.build('Google');
handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(#{raw @hash.to_json });
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
});