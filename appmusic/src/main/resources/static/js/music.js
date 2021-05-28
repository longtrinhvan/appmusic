(function() {
	$
		.getJSON(
			"http://localhost:8080/apimusic/getmusicpage?id=0",
			{
				format: "json"
			})
		.done(
			function(data) {
				var len = data.length;
				var trHTML = '';
				for (var i = 0; i < len; i++) {
					var id = data[i].id;
					var name = data[i].name;
					var idcategory = data[i].category.idcategory;
					var namecategory = data[i].category.namecategory;
					var idalbum = data[i].album.idalbum;
					var namealbum = data[i].album.namealbum;
					var url = data[i].url;
					var image = data[i].image;
					trHTML += '<tr><td>'
						+ id
						+ '</td><td>'
						+ name
						+ '</td><td>'
						+ namealbum
						+ '</td><td>'
						+ namecategory
						// 											+ '</td><td>'
						// 											+ '<iframe src="' + image + '" width="140" height="140"></iframe>'
						+ '</td><td>'
						+ '<button class="showhai" onclick="deleteMusic('
						+ id
						+ ')" ><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="trash-alt" class="svg-inline--fa fa-trash-alt fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M32 464a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V128H32zm272-256a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zM432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16z"></path></svg></button>'
						+ '</td><td>'
						+ '<button class="show" onclick="edit('
						+ id
						+ ')"><svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="edit" class="svg-inline--fa fa-edit fa-w-18" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="currentColor" d="M402.3 344.9l32-32c5-5 13.7-1.5 13.7 5.7V464c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V112c0-26.5 21.5-48 48-48h273.5c7.1 0 10.7 8.6 5.7 13.7l-32 32c-1.5 1.5-3.5 2.3-5.7 2.3H48v352h352V350.5c0-2.1.8-4.1 2.3-5.6zm156.6-201.8L296.3 405.7l-90.4 10c-26.2 2.9-48.5-19.2-45.6-45.6l10-90.4L432.9 17.1c22.9-22.9 59.9-22.9 82.7 0l43.2 43.2c22.9 22.9 22.9 60 .1 82.8zM460.1 174L402 115.9 216.2 301.8l-7.3 65.3 65.3-7.3L460.1 174zm64.8-79.7l-43.2-43.2c-4.1-4.1-10.8-4.1-14.8 0L436 82l58.1 58.1 30.9-30.9c4-4.2 4-10.8-.1-14.9z"></path></svg></button> '
						+ '</td></tr>';
				}
				$('#bidders').append(trHTML);
				$('#page').val(0);
			});

	$
		.getJSON(
			"http://localhost:8080/apicategory/getallcategory",
			{
				format: "json"
			})
		.done(
			function(data) {
				var len = data.length;
				var trHTML = '';
				for (var i = 0; i < len; i++) {
					var idcategory = data[i].idcategory;
					var namecategory = data[i].namecategory;
					trHTML += "<option value=" + "value" + idcategory + ">"
						+ namecategory + "</option>";
				}
				$('#categorymusic').append(trHTML);
			});

	$.getJSON("http://localhost:8080/apiaccount/getaccountlogin", {
		format: "json"
	}).done(function(data) {
		$('#nameaccountnha').text(data['fullname']);
	});
})();

$('.id_100').on('click', '#categorymusic', function(e) {
	var str = $("#categorymusic option:selected").val();
	$('#idcategorymusic').val(str.slice(5, str.length));
});

$('#div-searchalbum-1')
	.on(
		'click',
		'button',
		function(e) {
			var url = "http://localhost:8080/apialbum/searchnamealbum?namealbum="
				+ $('#searchalbum').val();
			;
			$.getJSON(url, {
				format: "json"
			}).done(function(data) {
				$('#idalbummusic').val(data.idalbum);
				$('#album').val(data.namealbum);
			});
		});

function edit(id) {
	var url = "http://localhost:8080/apimusic/getmusic?id=" + id;
	$.getJSON(url, {
		format: "json"
	}).done(
		function(data) {

			$('#id').val(data['id']);
			$('#name').val(data['name']);
			$('#url').val(data['url']);
			$('#image').val(data['image']);
			$('#audio').attr('src', data['url']);
			$('#imageiframe').attr('src', data['image']);
			$('#album').val(data['album'].namealbum);
			$("div.id_100 select").val(
				"value" + data['category'].idcategory);
			$('#idcategorymusic').val(data['category'].idcategory);
			$('#idalbummusic').val(data['album'].idalbum);
		});
};

function deleteMusic(id) {
	var data = {};
	data['id'] = id;
	$.ajax({
		url: 'http://localhost:8080/apimusic/deletemusic',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(data),
		dataType: "json"
	});
	window.location.href = "http://localhost:8080/music";
}

function createMusic() {
	var music = {};

	var album = {
		idalbum: $('#idalbummusic').val(),
		namealbum: " "
	};
	var category = {
		idcategory: $('#idcategorymusic').val(),
		namecategory: " "
	};
	music['name'] = $('#name').val();
	music['url'] = $('#url').val();
	music['image'] = $('#image').val();
	music['category'] = category;
	music['album'] = album;
	music['isdelete'] = 0;
	$.ajax({
		url: 'http://localhost:8080/apimusic/insertmusic',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(music),
		dataType: "json"
	});
	window.location.href = "http://localhost:8080/music";
}

function updateMusic() {
	var music = {};
	var album = {
		idalbum: $('#idalbummusic').val(),
		namealbum: " "
	};
	var category = {
		idcategory: $('#idcategorymusic').val(),
		namecategory: " "
	};
	music['id'] = $('#id').val();
	music['name'] = $('#name').val();
	music['url'] = $('#url').val();
	music['image'] = $('#image').val();
	music['category'] = category;
	music['album'] = album;
	music['isdelete'] = 0;
	$.ajax({
		url: 'http://localhost:8080/apimusic/updatemusic',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(music),
		dataType: "json"
	});
	window.location.href = "http://localhost:8080/music";
}

function back() {
	var page = parseInt($('#page').val());
	if (page > 0) {
		page = page - 1;
	}
	$
		.getJSON(
			"http://localhost:8080/apimusic/getmusicpage?id="
			+ page, {
			format: "json"
		})
		.done(
			function(data) {
				var len = data.length;
				var trHTML = '';
				for (var i = 0; i < len; i++) {
					var id = data[i].id;
					var name = data[i].name;
					var idcategory = data[i].category.idcategory;
					var namecategory = data[i].category.namecategory;
					var idalbum = data[i].album.idalbum;
					var namealbum = data[i].album.namealbum;
					var url = data[i].url;
					var image = data[i].image;
					trHTML += '<tr><td>'
						+ id
						+ '</td><td>'
						+ name
						+ '</td><td>'
						+ namealbum
						+ '</td><td>'
						+ namecategory
						// 											+ '</td><td>'
						// 											+ '<iframe src="' + image + '" width="140" height="140"></iframe>'
						+ '</td><td>'
						+ '<button class="showhai" onclick="deleteMusic('
						+ id
						+ ')" ><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="trash-alt" class="svg-inline--fa fa-trash-alt fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M32 464a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V128H32zm272-256a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zM432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16z"></path></svg></button>'
						+ '</td><td>'
						+ '<button class="show" onclick="edit('
						+ id
						+ ')"><svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="edit" class="svg-inline--fa fa-edit fa-w-18" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="currentColor" d="M402.3 344.9l32-32c5-5 13.7-1.5 13.7 5.7V464c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V112c0-26.5 21.5-48 48-48h273.5c7.1 0 10.7 8.6 5.7 13.7l-32 32c-1.5 1.5-3.5 2.3-5.7 2.3H48v352h352V350.5c0-2.1.8-4.1 2.3-5.6zm156.6-201.8L296.3 405.7l-90.4 10c-26.2 2.9-48.5-19.2-45.6-45.6l10-90.4L432.9 17.1c22.9-22.9 59.9-22.9 82.7 0l43.2 43.2c22.9 22.9 22.9 60 .1 82.8zM460.1 174L402 115.9 216.2 301.8l-7.3 65.3 65.3-7.3L460.1 174zm64.8-79.7l-43.2-43.2c-4.1-4.1-10.8-4.1-14.8 0L436 82l58.1 58.1 30.9-30.9c4-4.2 4-10.8-.1-14.9z"></path></svg></button> '
						+ '</td></tr>';
				}
				$("#bidders tr").remove();
				$('#bidders').append(trHTML);
				$('#page').val(page);
			});
}
function next() {
	var page = parseInt($('#page').val());
	page = page + 1;
	$
		.getJSON(
			"http://localhost:8080/apimusic/getmusicpage?id="
			+ page, {
			format: "json"
		})
		.done(
			function(data) {
				var len = data.length;
				var trHTML = '';
				for (var i = 0; i < len; i++) {
					var id = data[i].id;
					var name = data[i].name;
					var idcategory = data[i].category.idcategory;
					var namecategory = data[i].category.namecategory;
					var idalbum = data[i].album.idalbum;
					var namealbum = data[i].album.namealbum;
					var url = data[i].url;
					var image = data[i].image;
					trHTML += '<tr><td>'
						+ id
						+ '</td><td>'
						+ name
						+ '</td><td>'
						+ namealbum
						+ '</td><td>'
						+ namecategory
						// 											+ '</td><td>'
						// 											+ '<iframe src="' + image + '" width="140" height="140"></iframe>'
						+ '</td><td>'
						+ '<button class="showhai" onclick="deleteMusic('
						+ id
						+ ')" ><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="trash-alt" class="svg-inline--fa fa-trash-alt fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M32 464a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V128H32zm272-256a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zM432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16z"></path></svg></button>'
						+ '</td><td>'
						+ '<button class="show" onclick="edit('
						+ id
						+ ')"><svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="edit" class="svg-inline--fa fa-edit fa-w-18" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="currentColor" d="M402.3 344.9l32-32c5-5 13.7-1.5 13.7 5.7V464c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V112c0-26.5 21.5-48 48-48h273.5c7.1 0 10.7 8.6 5.7 13.7l-32 32c-1.5 1.5-3.5 2.3-5.7 2.3H48v352h352V350.5c0-2.1.8-4.1 2.3-5.6zm156.6-201.8L296.3 405.7l-90.4 10c-26.2 2.9-48.5-19.2-45.6-45.6l10-90.4L432.9 17.1c22.9-22.9 59.9-22.9 82.7 0l43.2 43.2c22.9 22.9 22.9 60 .1 82.8zM460.1 174L402 115.9 216.2 301.8l-7.3 65.3 65.3-7.3L460.1 174zm64.8-79.7l-43.2-43.2c-4.1-4.1-10.8-4.1-14.8 0L436 82l58.1 58.1 30.9-30.9c4-4.2 4-10.8-.1-14.9z"></path></svg></button> '
						+ '</td></tr>';
				}
				$("#bidders tr").remove();
				$('#bidders').append(trHTML);
				$('#page').val(page);
			});
}

function search() {
	var name = $('#searchname').val();
	$
		.getJSON(
			"http://localhost:8080/apimusic/searchmusicpagesize?name="
			+ name, {
			format: "json"
		})
		.done(
			function(data) {
				var len = data.length;
				var trHTML = '';
				for (var i = 0; i < len; i++) {
					var id = data[i].id;
					var name = data[i].name;
					var idcategory = data[i].category.idcategory;
					var namecategory = data[i].category.namecategory;
					var idalbum = data[i].album.idalbum;
					var namealbum = data[i].album.namealbum;
					var url = data[i].url;
					var image = data[i].image;
					trHTML += '<tr><td>'
						+ id
						+ '</td><td>'
						+ name
						+ '</td><td>'
						+ namealbum
						+ '</td><td>'
						+ namecategory
						// 											+ '</td><td>'
						// 											+ '<iframe src="' + image + '" width="140" height="140"></iframe>'
						+ '</td><td>'
						+ '<button class="showhai" onclick="deleteMusic('
						+ id
						+ ')" ><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="trash-alt" class="svg-inline--fa fa-trash-alt fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M32 464a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V128H32zm272-256a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zM432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16z"></path></svg></button>'
						+ '</td><td>'
						+ '<button class="show" onclick="edit('
						+ id
						+ ')"><svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="edit" class="svg-inline--fa fa-edit fa-w-18" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="currentColor" d="M402.3 344.9l32-32c5-5 13.7-1.5 13.7 5.7V464c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V112c0-26.5 21.5-48 48-48h273.5c7.1 0 10.7 8.6 5.7 13.7l-32 32c-1.5 1.5-3.5 2.3-5.7 2.3H48v352h352V350.5c0-2.1.8-4.1 2.3-5.6zm156.6-201.8L296.3 405.7l-90.4 10c-26.2 2.9-48.5-19.2-45.6-45.6l10-90.4L432.9 17.1c22.9-22.9 59.9-22.9 82.7 0l43.2 43.2c22.9 22.9 22.9 60 .1 82.8zM460.1 174L402 115.9 216.2 301.8l-7.3 65.3 65.3-7.3L460.1 174zm64.8-79.7l-43.2-43.2c-4.1-4.1-10.8-4.1-14.8 0L436 82l58.1 58.1 30.9-30.9c4-4.2 4-10.8-.1-14.9z"></path></svg></button> '
						+ '</td></tr>';
				}
				$("#bidders tr").remove();
				$('#bidders').append(trHTML);
			});
}

function logout() {
	$.getJSON("http://localhost:8080/apiaccount/logout", {
		format: "json"
	}).done();
	window.location.href = "http://localhost:8080/login";
}
function musiclink() {
	var url = window.location.href;
	var indextoken = url.indexOf("token=") + 6;
	var length = url.length;
	var urlx = url.slice(indextoken, length);
	window.location.href = "http://localhost:8080/music?token=" + urlx;
}
function accountlink() {
	window.location.href = "http://localhost:8080/account";
}