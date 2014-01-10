function showRating(span_id,count,avg) {
	var span = $('#' + span_id);
	span.empty();
	span.append('<span class="badge badge-success">' + count + '</span>');
	for (var i = 0 ; i < 10 ; i ++) {
		if ( i < avg ) {
			span.append('<i class="icon-star"></i>');
		} else {
			span.append('<i class="icon-star-empty"></i>');
		}
	}
}

    	             