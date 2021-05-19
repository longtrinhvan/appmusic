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
<!-- css -->
<link href="<c:url value='/template/login/css/home.css' />"
	rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value='/template/common/all.min.css' />"
	rel="stylesheet" type="text/css" media="all" />

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
	height: 800px;
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
	height: 800px;
}

.center-mm1 {
	float: left;
	width: 60%;
	height: 800px;
	font-size: 13px;
}

.center-mm2 {
	float: left;
	width: 40%;
	height: 800px;
}

.img {
	margin: 10px;
	text-align: center;
	padding: 10px;
	background-color: turquoise;
	border-radius: 5px;
}

.img iframe {
	border-radius: 5px;
}

.audio {
	margin: 10px;
	text-align: center;
	padding: 10px;
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
	height: 40px;
	border-radius: 3px;
	border: 1px solid rgb(177, 177, 177);
	padding-left: 15px;
}

.detail button {
	float: right;
	margin: 10px 57px 10px 10px;
	width: 100px;
	height: 40px;
	border-radius: 3px;
	color: cornsilk;
	background-color: teal;
}

.show {
	width: 70px;
	height: 27px;
	border-radius: 3px;
	color: cornsilk;
	background-color: teal;
}

.showhai {
	width: 70px;
	height: 40px;
	background-color: transparent;
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
						<th>Category</th>
						<th>Image</th>
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
					width="300" height="300" id="imageiframe"></iframe>
			</div>
			<div class="audio">
				<iframe
					src="https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview"
					width="470" height="70" id="audio"></iframe>
			</div>
			<div class="detail">
				<label>Name</label> <input type="text" id="name"> <label>Url</label>
				<input type="text" id="url"> <label>Image</label> <input
					type="text" id="image"> <input type="hidden" id="id">
				<button onclick="updateMusic()">Save</button>
				<button onclick="createMusic()">Create</button>
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
									var category = data[i].category;
									var url = data[i].url;
									var image = data[i].image;
									trHTML += '<tr><td>'
											+ id
											+ '</td><td>'
											+ name
											+ '</td><td>'
											+ category
											+ '</td><td>'
											+ '<iframe src="' + image + '" width="140" height="140"></iframe>'
											+ '</td><td>'
											+ '<button class="showhai" onclick="deleteMusic('
											+ id
											+ ')" ><i class="fas fa-trash-alt" style="color: rgb(206, 30, 30)" ></i></button>'
											+ '</td><td>'
											+ '<button id="'+ id +'" class="show">Edit</button> '
											+ '</td></tr>';
								}
								$('#bidders').append(trHTML);
							});
		})();

		$('.center-mm1').on(
				'click',
				'.show',
				function(e) {
					var url = "http://localhost:8080/apimusic/getmusic?id="
							+ e.target.id;
					$.getJSON(url, {
						format : "json"
					}).done(function(data) {
						$('#id').val(data['id']);
						$('#name').val(data['name']);
						$('#url').val(data['url']);
						$('#image').val(data['image']);
						$('#audio').attr('src', data['url']);
						$('#imageiframe').attr('src', data['image']);
					});
				});

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
			music['name'] = $('#name').val();
			music['url'] = $('#url').val();
			music['image'] = $('#image').val();
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
			music['id'] = $('#id').val();
			music['name'] = $('#name').val();
			music['url'] = $('#url').val();
			music['image'] = $('#image').val();
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