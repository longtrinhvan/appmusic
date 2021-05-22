<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Login</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="<c:url value='/template/paging/jquery.twbsPagination.js' />"
	type="text/javascript"></script>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	background-image:
		url("https://thietbiketnoi.com/wp-content/uploads/2020/01/tong-hop-hinh-nen-background-vector-designer-dep-do-phan-giai-fhd-2k-4k-moi-nhat-16.jpg");
}

.body-center {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.div-form {
	background-image:
		url("https://anhdep123.com/wp-content/uploads/2020/11/hinh-anh-background.jpeg");
	border: 3px solid #f1f1f1;
	width: 310px;
	height: 600px;
	border-radius: 10px;
	margin-top: 50px;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 15px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
	border-radius: 50px;
	height: 40px;
	outline: none;
}

button {
	background-color: #1a517e;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	border-radius: 50px;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
	border-radius: 10px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>

<body>
	<div class="body-center">
		<div class="div-form">
			<div class="imgcontainer">
				<img
					src="https://w7.pngwing.com/pngs/407/557/png-transparent-password-strength-computer-security-password-policy-managed-security-service-procurement-icon-blue-logo-sign.png"
					alt="Avatar" class="avatar">
			</div>

			<div class="container">
				<label for="uname"><b>Username</b></label> <input class="name"
					type="text" placeholder="Enter Username" name="uname" required>
				<label for="psw"><b>Password</b></label> <input class="password"
					type="password" placeholder="Enter Password" name="psw" required>

				<button onclick="login()">Login</button>
				<label> <input type="checkbox" checked="checked"
					name="remember"> Remember me
				</label>
			</div>

			<div class="container">
				<button type="button" class="cancelbtn">Cancel</button>
				<span class="psw">Forgot password?</span>
			</div>
		</div>
	</div>
	<script>
		function login() {
			var data = {};
			data['name'] = $('.name').val();
			data['password'] = $('.password').val();
			$.ajax({
				url : 'http://localhost:8080/login',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : "json",
				success : function(result) {
					console.log("Hello world!");
					window.location.href = "http://localhost:8080/music";
				},
				error : function(error) {
				}
			});
		}
	</script>
</body>

</html>