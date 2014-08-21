$(document).ready(function() {
	$.get('/posts/' + $('#map').data("id"), function(post) {
		var map = new GMaps({
		  div: '#map',
		  lat: -12.043333,
		  lng: -77.028333
		});
		GMaps.geocode({
		  address: post.address,
		  callback: function(results, status) {
		    if (status == 'OK') {
		      var latlng = results[0].geometry.location;
		      map.setCenter(latlng.lat(), latlng.lng());
		      map.addMarker({
		        lat: latlng.lat(),
		        lng: latlng.lng()
		      });
		    }
		  }
		});
	});
});