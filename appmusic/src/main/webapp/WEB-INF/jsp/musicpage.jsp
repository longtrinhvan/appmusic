<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Music</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<!-- css -->
<link href="<c:url value='/template/login/css/home.css' />"
	rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value='/template/common/all.min.css' />"
	rel="stylesheet" type="text/css" media="all" />

<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<body>

	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>name</th>
				<th>url</th>
				<th>image</th>
				<th>Sửa</th>
				<th>Xóa</th>
			</tr>
		</thead>
		<tbody id="bidders">

		</tbody>
	</table>
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
									var url = data[i].url;
									var image = data[i].image;
									trHTML += '<tr><td>'
											+ id
											+ '</td><td>'
											+ name
											+ '</td><td>'
											+ url
											+ '</td><td>'
											+ image
											+ '</td><td><a href="${editURL}"><i style="color: rgb(44, 142, 212); font-size: 18px;" class="fas fa-edit"></i></a></td><td><i class="fas fa-trash-alt"></i></td></tr>';
								}
								$('#bidders').append(trHTML);
							});
		})();
	</script>

</body>
</html>