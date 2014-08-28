$(document).ready(function() {
	var pusher = new Pusher('b3a141975cd83e2d9ace');
	var channel = pusher.subscribe('instagram_test');
	channel.bind('my_event', function(data) {
	  $('body').prepend('<img src=' + data.message + '></img>');
	});
});