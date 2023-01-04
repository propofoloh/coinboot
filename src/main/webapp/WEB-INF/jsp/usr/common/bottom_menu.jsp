<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="../css.css">

<html>
<head lang="en">
	<style>
		.bottom_menu { 
			position: fixed; 
			bottom: 0px; 
			left: 0px; 
			width: 100%; 
			height: 50px; 
			z-index:100; 
			border-top: 1px solid black; 
			background-color: white 
			}
		.bottom_menu > div { 
			float: left; 
			width: 20%; 
			height: 100%; 
			text-align: center; 
			padding-top: 13px; 
			}
	</style>
</head>
<body>
	<div class="bottom_menu">
		<div>
			<img onclick="history.back()" src="/img/back.png"/>
		</div>
		<div>
			<img src="/img/up.png"/>
		</div>
		<div>
			<img src="/img/down.png"/>
		</div>
		<div>
			<a href="/usr/member/myPage">
				<img src="/img/face.png"/>
			</a>
		</div>
		<div>
			<img src="/img/setting.png" />
		</div>
	</div>
</body>
</html>