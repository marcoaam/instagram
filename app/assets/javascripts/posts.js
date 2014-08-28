$(document).ready(function() {
	var pusher = new Pusher('b3a141975cd83e2d9ace');
	var channel = pusher.subscribe('instagram_test');
	channel.bind('my_event', function(data) {
	  $('.container .row').prepend('<div class="col-md-12"><div class="new_post"><a href="/" class="new_post_link">' + data.message + '</a></div></div>');
	});
});