<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Account</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="<c:url value='/template/paging/jquery.twbsPagination.js' />"
	type="text/javascript"></script>

<style>
table {
	font-family: Georgia, 'Times New Roman', Times, serif;
	border-collapse: collapse;
	width: 95%;
	margin: 10px;
}

th {
	background-color: rgb(218, 218, 218);
	padding: 9px;
	border: 1px solid rgb(218, 218, 218);
	text-align: center;
	font-weight: unset;
	color: rgb(41, 41, 41);
}

td {
	border: 1px solid rgb(218, 218, 218);
	text-align: center;
	padding: 7px;
	font-weight: unset;
	color: rgb(49, 49, 49);
	font-size: 13px;
}

table td:nth-last-child(5) {
	text-align: left;
	padding-left: 15px;
}

#div-searchalbum-1xxx input {
	position: absolute;
	float: left;
	width: 280px;
	height: 29px;
	padding-left: 20px;
}

#div-searchalbum-1xxx button {
	position: absolute;
	margin-top: 11px;
	width: 45px;
	height: 29px;
	margin-left: 265px;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
	border-left: 1px solid rgb(112, 112, 112);
}

#div-searchalbum-1xxx svg {
	color: rgb(67, 83, 177);
	border-radius: 3px;
	width: 20px;
	height: 29px;
}

#div-searchalbum-1xxx {
	float: left;
	width: 210px;
	height: 50px;
	margin-top: 40px;
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

input {
	outline: none;
}

.menu {
	float: left;
	height: 800px;
	width: 15%;
	background-image:
		url("https://thietbiketnoi.com/wp-content/uploads/2020/01/tong-hop-hinh-nen-background-vector-designer-dep-do-phan-giai-fhd-2k-4k-moi-nhat-16.jpg");
}

.account {
	width: 100%;
	height: 250px;
	background-color: transparent;
	font-family: Georgia, 'Times New Roman', Times, serif;
	font-size: 12px;
}

.account img {
	margin-top: 20px;
	width: 150px;
	height: 150px;
	border-radius: 50%;
	background-color: transparent;
	margin-left: 35px;
}

.account label {
	display: block;
	text-align: center;
	margin-top: 20px;
	background-color: transparent;
	color: rgb(226, 226, 226);
	font-size: 13px;
}

.account p {
	margin-top: 10px;
	text-align: center;
	background-color: transparent;
	color: rgb(226, 226, 226);
	font-size: 13px;
}

.vertical-menu {
	width: 100%;
	height: 550px;
	background-image:
		url("https://anhdep123.com/wp-content/uploads/2020/11/hinh-anh-background.jpeg");
}

.vertical-menu a {
	background-color: transparent;
	color: rgb(41, 41, 41);
	display: block;
	padding: 12px;
	text-decoration: none;
	font-weight: unset;
	font-size: 13px;
}

.vertical-menu a:hover {
	background-color: #ccc;
}

.vertical-menu a.active {
	background-color: rgb(43, 88, 155);
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
	margin: 10px 10px 10px 0px;
	text-align: center;
	padding: 5px;
	background-color: rgb(226, 226, 226);
	border-radius: 5px;
	margin-left: 10px;
}

.img img {
	border-radius: 5px;
}

#audio {
	margin-left: 10px;
	border-radius: 5px;
	width: 96%;
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
	color: rgb(67, 67, 163);
}

.showhai svg {
	width: 15px;
	height: 15px;
	color: rgb(219, 50, 50);
}

#div-searchalbum {
	width: auto;
	height: 50px;
}

#div-searchalbum-1 input {
	position: absolute;
	float: left;
	width: 232px;
	height: 31px;
	padding-left: 70px;
}

#div-searchalbum-1 label {
	position: absolute;
	float: left;
	margin-top: 10px;
	margin-left: 10px;
	border: 1px solid rgb(177, 177, 177);
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
	padding: 7.7px;
	padding-right: 9px;
	padding-left: 11px;
	font-size: 13px;
}

#div-searchalbum-1 button {
	position: absolute;
	margin-top: 11px;
	width: 45px;
	height: 31px;
	margin-left: 265px;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
	border-left: 1px solid rgb(112, 112, 112);
}

#div-searchalbum-1 svg {
	color: rgb(67, 83, 177);
	border-radius: 3px;
	width: 20px;
	height: 31px;
}

#div-searchalbum-1 {
	float: left;
	width: 210px;
	height: 50px;
}

#idx100 {
	float: left;
	height: 53px;
	width: 180px;
}

#idx100 label {
	float: left;
	margin-top: 10px;
	margin-left: 11px;
	border: 1px solid rgb(177, 177, 177);
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
	width: 40px;
	height: 24px;
	padding-top: 7px;
	padding-left: 20px;
	background-color: rgb(226, 226, 226);
	font-size: 13px;
}

#categorymusic {
	float: left;
	margin: 10px 0px 0px -11px;
	width: 100px;
	height: 33px;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
	border: 1px solid rgb(177, 177, 177);
	outline: none;
	padding-left: 20px;
	font-size: 13px;
}

#dixname {
	clear: left;
	height: 55px;
	width: 100%;
}

#dixname label {
	float: left;
	margin-top: 10px;
	margin-left: 11px;
	border: 1px solid rgb(177, 177, 177);
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
	width: 50px;
	height: 24px;
	padding-top: 7px;
	padding-left: 10px;
	font-size: 13px;
}

#dixname input {
	float: left;
	margin: 10px 0px 0px -11px;
	width: 407px;
	height: 31px;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
	border-top-left-radius: 0px;
	border-bottom-left-radius: 0px;
	border: 1px solid rgb(177, 177, 177);
}

.divurl {
	height: 55px;
	width: 100%;
}

.divurl label {
	float: left;
	margin-top: 10px;
	margin-left: 11px;
	border: 1px solid rgb(177, 177, 177);
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
	width: 70px;
	height: 24px;
	padding-top: 7px;
	padding-left: 20px;
	font-size: 13px;
}

.divurl input {
	float: left;
	margin: 10px 0px 0px -11px;
	width: 377px;
	height: 31px;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
	border-top-left-radius: 0px;
	border-bottom-left-radius: 0px;
	border: 1px solid rgb(177, 177, 177);
}

.divimage {
	clear: left;
	height: 55px;
	width: 100%;
}

.divimage label {
	float: left;
	margin-top: 10px;
	margin-left: 11px;
	border: 1px solid rgb(177, 177, 177);
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
	width: 50px;
	height: 24px;
	padding-top: 7px;
	padding-left: 10px;
	font-size: 13px;
}

.divimage input {
	float: left;
	margin: 10px 0px 0px -11px;
	width: 407px;
	height: 31px;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
	border-top-left-radius: 0px;
	border-bottom-left-radius: 0px;
	border: 1px solid rgb(177, 177, 177);
}

#Create {
	margin: 10px;
	float: right;
	border-radius: 3px;
	width: 70px;
	height: 30px;
	border: 1px solid rgb(177, 177, 177);
	background-color: rgb(115, 157, 197);
}

#Create svg {
	margin-top: 2px;
	color: rgb(3, 101, 192);
	width: 25x;
	height: 25px;
	background-color: rgb(115, 157, 197);
}

#Save {
	float: right;
	margin: 10px 21px 10px 10px;
	border-radius: 3px;
	width: 70px;
	height: 30px;
	border: 1px solid rgb(177, 177, 177);
	background-color: rgb(226, 176, 130);
}

#Save svg {
	margin-top: 2px;
	color: rgb(202, 122, 48);
	width: 25x;
	height: 25px;
	background-color: rgb(226, 176, 130);
}

.pagination {
	display: inline-block;
	float: right;
	margin-right: 30px;
}

.pagination a:nth-child(1) {
	color: rgb(255, 255, 255);
	float: left;
	padding: 6px 20px;
	text-decoration: none;
	background-color: rgb(84, 84, 163);
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
	border-right: 1px solid rgb(207, 204, 204);
}

.pagination a:nth-child(2) {
	color: rgb(255, 255, 255);
	float: left;
	padding: 6px 20px;
	text-decoration: none;
	background-color: rgb(84, 84, 163);
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
}
</style>
</head>

<body>
	<div class="menu">
		<div class="account">
			<img
				src="https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj"
				width="270" height="270"></img> <label>Nhân Viên:</label>
			<p id="nameaccountnha"></p>
		</div>
		<div class="vertical-menu">
			<a onclick="musiclink()" class="active">Music</a> <a
				onclick="accountlink()">Account</a> <a onclick="logout()">Logout</a>
		</div>
	</div>
	<div class="center">
		<div class="center-mm1">
			<div id="div-searchalbum-1xxx">
				<input type="text" id="searchname">
				<button onclick="search()">
					<svg aria-hidden="true" focusable="false" data-prefix="fas"
						data-icon="search" class="svg-inline--fa fa-search fa-w-16"
						role="img" xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 512 512">
						<path fill="currentColor"
							d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z">
						</path>
					</svg>
				</button>
			</div>
			<table>
				<thead>
					<tr>
						<th>Id</th>
						<th>Role</th>
						<th>User</th>
						<th>Full Name</th>
						<th>Sửa</th>
						<th>Xóa</th>
					</tr>
				</thead>
				<tbody id="biddersx">

				</tbody>
			</table>
			<div class="pagination">
				<a onclick="back()">❮</a> <a onclick="next()">❯</a>
			</div>
		</div>
		<div class="center-mm2">
			<div class="img">
				<img
					src="https://i1.sndcdn.com/artworks-LG3sdV8andowvRJL-Sy3DyQ-t500x500.jpg"
					width="270" height="270" id="imageiframe"></img>
			</div>
			<div class="detail">
				<div id="dixname">
					<label>User</label> <input type="text" id="name">
				</div>
				<div class="divurl">
					<label>Full Name</label> <input type="text" id="url">
				</div>
				<div id="div-searchalbum">
					<div class="id_100" id="idx100">
						<label>Role</label> <select name="categorymusic"
							id="categorymusic">
						</select>
					</div>
					<div id="div-searchalbum-1">
						<input type="password" id="searchalbum"> <label>Password</label>
						<button>
							<svg aria-hidden="true" focusable="false" data-prefix="fas"
								data-icon="eye" class="svg-inline--fa fa-eye fa-w-18" role="img"
								xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
								<path fill="currentColor"
									d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z">
								</path>
							</svg>
						</button>
					</div>
				</div>
				<div class="divimage">
					<label>Image</label> <input type="text" id="image">
				</div>
				<input type="hidden" id="id"> <input type="hidden"
					id="idcategorymusic"> <input type="hidden"
					id="idalbummusic"> <input type="hidden" id="page">
				<button id="Save" onclick="updateMusic()">
					<svg aria-hidden="true" focusable="false" data-prefix="fas"
						data-icon="save" class="svg-inline--fa fa-save fa-w-14" role="img"
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
						<path fill="currentColor"
							d="M433.941 129.941l-83.882-83.882A48 48 0 0 0 316.118 32H48C21.49 32 0 53.49 0 80v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48V163.882a48 48 0 0 0-14.059-33.941zM224 416c-35.346 0-64-28.654-64-64 0-35.346 28.654-64 64-64s64 28.654 64 64c0 35.346-28.654 64-64 64zm96-304.52V212c0 6.627-5.373 12-12 12H76c-6.627 0-12-5.373-12-12V108c0-6.627 5.373-12 12-12h228.52c3.183 0 6.235 1.264 8.485 3.515l3.48 3.48A11.996 11.996 0 0 1 320 111.48z">
						</path>
					</svg>
				</button>
				<button id="Create" onclick="createMusic()">
					<svg aria-hidden="true" focusable="false" data-prefix="fas"
						data-icon="folder-plus"
						class="svg-inline--fa fa-folder-plus fa-w-16" role="img"
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
						<path fill="currentColor"
							d="M464,128H272L208,64H48A48,48,0,0,0,0,112V400a48,48,0,0,0,48,48H464a48,48,0,0,0,48-48V176A48,48,0,0,0,464,128ZM359.5,296a16,16,0,0,1-16,16h-64v64a16,16,0,0,1-16,16h-16a16,16,0,0,1-16-16V312h-64a16,16,0,0,1-16-16V280a16,16,0,0,1,16-16h64V200a16,16,0,0,1,16-16h16a16,16,0,0,1,16,16v64h64a16,16,0,0,1,16,16Z">
						</path>
					</svg>
				</button>
			</div>
		</div>
	</div>
	<script>
		(function() {
			$
					.getJSON(
							"http://localhost:8080/apiaccount/getaccountpagesize?page=0",
							{
								format : "json"
							})
					.done(
							function(data) {
								var len = data.length;
								var trHTML = '';
								for (var i = 0; i < len; i++) {
									var id = data[i].id;
									var idrole = data[i].role.namerole;
									var name = data[i].name;
									var fullname = data[i].fullname;
									trHTML += '<tr><td>'
											+ id
											+ '</td><td>'
											+ idrole
											+ '</td><td>'
											+ name
											+ '</td><td>'
											+ fullname
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
								$('#biddersx').append(trHTML);
								$('#page').val(0);
							});

			$.getJSON("http://localhost:8080/apiaccount/getallrole", {
				format : "json"
			}).done(
					function(data) {
						var len = data.length;
						var trHTML = '';
						for (var i = 0; i < len; i++) {
							var idrole = data[i].idrole;
							var namerole = data[i].namerole;
							trHTML += "<option value=" + "value" + idrole + ">"
									+ namerole + "</option>";
						}
						$('#categorymusic').append(trHTML);
					});

			$.getJSON("http://localhost:8080/apiaccount/getaccountlogin", {
				format : "json"
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
				url : 'http://localhost:8080/apiaccount/deleteaccount',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : "json"
			});
			window.location.href = "http://localhost:8080/account";
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
			window.location.href = "http://localhost:8080/account";
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
			window.location.href = "http://localhost:8080/account";
		}

		function back() {
			var page = parseInt($('#page').val());
			if (page > 0) {
				page = page - 1;
			}
			$
					.getJSON(
							"http://localhost:8080/apiaccount/getaccountpagesize?page="
									+ page, {
								format : "json"
							})
					.done(
							function(data) {
								var len = data.length;
								var trHTML = '';
								for (var i = 0; i < len; i++) {
									var id = data[i].id;
									var idrole = data[i].role.namerole;
									var name = data[i].name;
									var fullname = data[i].fullname;
									trHTML += '<tr><td>'
											+ id
											+ '</td><td>'
											+ idrole
											+ '</td><td>'
											+ name
											+ '</td><td>'
											+ fullname
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
								$("#biddersx tr").remove();
								$('#biddersx').append(trHTML);
								$('#page').val(page);
							});
		}
		function next() {
			var page = parseInt($('#page').val());
			page = page + 1;
			$
					.getJSON(
							"http://localhost:8080/apiaccount/getaccountpagesize?page="
									+ page, {
								format : "json"
							})
					.done(
							function(data) {
								var len = data.length;
								var trHTML = '';
								for (var i = 0; i < len; i++) {
									var id = data[i].id;
									var idrole = data[i].role.namerole;
									var name = data[i].name;
									var fullname = data[i].fullname;
									trHTML += '<tr><td>'
											+ id
											+ '</td><td>'
											+ idrole
											+ '</td><td>'
											+ name
											+ '</td><td>'
											+ fullname
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
								$("#biddersx tr").remove();
								$('#biddersx').append(trHTML);
								$('#page').val(page);
							});
		}

		function search() {
			var name = $('#searchname').val();
			$
					.getJSON(
							"http://localhost:8080/apimusic/searchmusicpagesize?name="
									+ name, {
								format : "json"
							})
					.done(
							function(data) {
								var len = data.length;
								var trHTML = '';
								for (var i = 0; i < len; i++) {
									var id = data[i].id;
									var idrole = data[i].role.namerole;
									var name = data[i].name;
									var fullname = data[i].fullname;
									trHTML += '<tr><td>'
											+ id
											+ '</td><td>'
											+ idrole
											+ '</td><td>'
											+ name
											+ '</td><td>'
											+ fullname
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
								$("#biddersx tr").remove();
								$('#biddersx').append(trHTML);
							});
		}

		function logout() {
			$.getJSON("http://localhost:8080/apiaccount/logout", {
				format : "json"
			}).done();
			window.location.href = "http://localhost:8080/login";
		}
		function musiclink() {
			window.location.href = "http://localhost:8080/music";
		}
		function accountlink() {
			window.location.href = "http://localhost:8080/account";
		}
	</script>
</body>

</html>