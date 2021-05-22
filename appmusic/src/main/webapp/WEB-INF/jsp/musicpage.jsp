<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Music</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="<c:url value='/template/paging/jquery.twbsPagination.js' />"
	type="text/javascript"></script>

<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 95%;
	margin: 10px;
	background-color: darkgray;
}

th {
	background-color: darkgray;
	padding: 10px;
	border: 1px solid #dddddd;
	text-align: center;
}

td {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>

<style>
* {
	margin: 0;
	padding: 0;
	border: none;
	background-color: white;
	font-family: arial, sans-serif;
	font-size: 14px;
}

.menu {
	float: left;
	height: 900px;
	width: 15%;
	background-color: teal;
}

.account {
	width: 100%;
	height: 200px;
	background-color: transparent;
}

.account img {
	margin-top: 2%;
	margin-left: 15%;
	width: 150px;
	height: 150px;
	border-radius: 50%;
	background-color: transparent;
}

.vertical-menu {
	width: 100%;
}

.vertical-menu a {
	background-color: #eee;
	color: black;
	display: block;
	padding: 12px;
	text-decoration: none;
}

.vertical-menu a:hover {
	background-color: #ccc;
}

.vertical-menu a.active {
	background-color: #04AA6D;
	color: white;
}

.center {
	float: left;
	width: 85%;
	height: 900px;
}

.center-mm1 {
	float: left;
	width: 60%;
	height: 900px;
	font-size: 13px;
}

.center-mm2 {
	float: left;
	width: 40%;
	height: 900px;
}

.img {
	margin: 10px;
	text-align: center;
	padding: 5px;
	background-color: turquoise;
	border-radius: 5px;
}

.img iframe {
	border-radius: 5px;
}

.audio {
	margin: 10px;
	text-align: center;
	padding: 5px;
	background-color: turquoise;
	border-radius: 5px;
}

label {
	margin: 10px;
}

input {
	margin: 10px;
	display: block;
	width: 450px;
	height: 30px;
	border-radius: 3px;
	border: 1px solid rgb(177, 177, 177);
	padding-left: 15px;
}

.show svg {
	width: 20px;
	height: 20px;
	color: blue;
}

.showhai svg {
	width: 15px;
	height: 15px;
	color: red;
}

#categorymusic {
	margin: 10px;
	display: block;
	width: 150px;
	height: 30px;
	border-radius: 3px;
	border: 1px solid rgb(177, 177, 177);
	padding-left: 15px;
}

#div-searchalbum {
	margin-top: 10px;
	width: auto;
	height: 110px;
}

#div-searchalbum-1 input {
	float: left;
	width: 150px;
}

#div-searchalbum-1 button {
	margin: 10px;
	float: left;
	border-radius: 3px;
	color: cornsilk;
	width: 70px;
	height: 30px;
	background-color: #979915;
}

#div-searchalbum-1 {
	width: auto;
	height: 50px;
}

#div-searchalbum-2 {
	width: auto;
	height: 50px;
}

#div-searchalbum-2 button {
	margin: 10px;
	float: left;
	border-radius: 3px;
	color: cornsilk;
	width: 70px;
	height: 30px;
	background-color: #0e8a7f;
}

#div-searchalbum-2 input {
	clear: left;
	float: left;
	width: 150px;
}

#Create {
	margin: 10px;
	float: right;
	border-radius: 3px;
	color: cornsilk;
	width: 70px;
	height: 30px;
	background-color: #a31628;
}

#Save {
	float: right;
	margin: 10px 40px 10px 10px;
	border-radius: 3px;
	color: cornsilk;
	width: 70px;
	height: 30px;
	background-color: #0e8a7f;
}
</style>
</head>

<body>
	<div class="menu">
		<div class="account"></div>
		<div class="vertical-menu">
			<a href="#" class="active">Home</a> <a href="#">Music</a> <a href="#">Account</a>
			<a href="#">Logout</a>
		</div>
	</div>
	<div class="center">
		<div class="center-mm1">
			<table>
				<thead>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Album</th>
						<th>Category</th>
						<th>Sửa</th>
						<th>Xóa</th>
					</tr>
				</thead>
				<tbody id="bidders">

				</tbody>
			</table>
		</div>
		<div class="center-mm2">
			<div class="img">
				<iframe
					src="https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview"
					width="270" height="270" id="imageiframe"></iframe>
			</div>
			<div class="audio">
				<iframe
					src="https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview"
					width="470" height="60" id="audio"></iframe>
			</div>
			<div class="detail">
				<label>Album</label>
				<div id="div-searchalbum">
					<div id="div-searchalbum-1">
						<input type="text" id="searchalbum">
						<button>Tìm</button>
					</div>
					<div id="div-searchalbum-2">
						<input type="text" id="album">
						<button>Chọn</button>
						<button>Thêm</button>
					</div>
				</div>
				<div class="id_100">
					<label>Category Music</label> <select name="categorymusic"
						id="categorymusic">
					</select>
				</div>
				<label>Name</label> <input type="text" id="name"> <label>Url</label>
				<input type="text" id="url"> <label>Image</label> <input
					type="text" id="image"> <input type="hidden" id="id">
				<input type="hidden" id="idcategorymusic"><input
					type="hidden" id="idalbummusic">
				<button id="Save" onclick="updateMusic()">Save</button>
				<button id="Create" onclick="createMusic()">Create</button>
			</div>
		</div>
	</div>
	<script>
		(function() {
			$
					.getJSON(
							"http://localhost:8080/apimusic/getmusic-page?id=0",
							{
								format : "json"
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
							});

			$
					.getJSON(
							"http://localhost:8080/apicategory/getallcategory",
							{
								format : "json"
							})
					.done(
							function(data) {
								var len = data.length;
								var trHTML = '';
								for (var i = 0; i < len; i++) {
									var idcategory = data[i].idcategory;
									var namecategory = data[i].namecategory;
									trHTML += "<option value=" + "value" + idcategory +">"
											+ namecategory + "</option>";
								}
								$('#categorymusic').append(trHTML);
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
								format : "json"
							}).done(function(data) {
								$('#idalbummusic').val(data.idalbum);
								$('#album').val(data.namealbum);
							});
						});

		function edit(id) {
			var url = "http://localhost:8080/apimusic/getmusic?id=" + id;
			$.getJSON(url, {
				format : "json"
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
				url : 'http://localhost:8080/apimusic/deletemusic',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : "json"
			});
			window.location.href = "http://localhost:8080/music";
		}

		function createMusic() {
			var music = {};

			var album = {
				idalbum : $('#idalbummusic').val(),
				namealbum : " "
			};
			var category = {
				idcategory : $('#idcategorymusic').val(),
				namecategory : " "
			};
			music['name'] = $('#name').val();
			music['url'] = $('#url').val();
			music['image'] = $('#image').val();
			music['category'] = category;
			music['album'] = album;
			music['isdelete'] = 0;
			$.ajax({
				url : 'http://localhost:8080/apimusic/insertmusic',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(music),
				dataType : "json"
			});
			window.location.href = "http://localhost:8080/music";
		}

		function updateMusic() {
			var music = {};
			var album = {
				idalbum : $('#idalbummusic').val(),
				namealbum : " "
			};
			var category = {
				idcategory : $('#idcategorymusic').val(),
				namecategory : " "
			};
			music['id'] = $('#id').val();
			music['name'] = $('#name').val();
			music['url'] = $('#url').val();
			music['image'] = $('#image').val();
			music['category'] = category;
			music['album'] = album;
			music['isdelete'] = 0;
			$.ajax({
				url : 'http://localhost:8080/apimusic/updatemusic',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(music),
				dataType : "json"
			});
			window.location.href = "http://localhost:8080/music";
		}
	</script>
</body>

</html>