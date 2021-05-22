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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
        }

        .body-center {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        form {
            border: 3px solid #f1f1f1;
            width: 310px;
            height: 500px;
            border-radius: 10px;
            margin-top: 100px;
        }

        input[type=text],
        input[type=password] {
            width: 100%;
            padding: 12px 15px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 50px;
            height: 40px;
            outline:none;
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
        <form >
            <div class="imgcontainer">
            	<img src="https://w7.pngwing.com/pngs/407/557/png-transparent-password-strength-computer-security-password-policy-managed-security-service-procurement-icon-blue-logo-sign.png" alt="Avatar" class="avatar">
            </div>

            <div class="container">
                <label for="uname"><b>Username</b></label>
                <input type="text" placeholder="Enter Username" name="uname" required>

                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="psw" required>

                <button type="submit">Login</button>
                <label>
                    <input type="checkbox" checked="checked" name="remember"> Remember me
                </label>
            </div>

            <div class="container">
                <button type="button" class="cancelbtn">Cancel</button>
                <span class="psw">Forgot <a href="#">password?</a></span>
            </div>
        </form>
    </div>
</body>

</html>