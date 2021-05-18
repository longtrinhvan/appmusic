<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>test</title>
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
	width: 85%;
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
			$.getJSON("http://localhost:8080/apimusic/getmusic?id=1", {
				format : "json"
			}).done(function(data) {
				$("#a").append(data['name']);
			});
		})();
	</script>

</body>
</html>