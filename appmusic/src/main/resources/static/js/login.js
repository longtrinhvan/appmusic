function login() {
	var data = {};
	data['name'] = $('.name').val();
	data['password'] = $('.password').val();
	$.ajax({
		url: 'http://localhost:8080/login',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(data),
		dataType: "json",
		success: function(data, textStatus, request) {
			$('#tokenna').val(data.token);
			window.location.href = "http://localhost:8080/music?token=" + $('#tokenna').val();
		}
	});
}