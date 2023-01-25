<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css.csss">

<!-- 애드센스 
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-1107226096880396"
     crossorigin="anonymous"></script>
     -->
<div id='wrapper'>

<c:set var="pageTitle" value="" />
<%@ include file="../common/head.jspf"%>

<section class="mt-5">
  <div class="container mx-auto px-3" style="font-size:20px;">
   <a href="/usr/article/list?boardId=2">PC 버전 - 유머 게시판 이동하기</a>
   <br>
   <br>
   <a href="/usr/article/m.list?boardId=2">모바일 버전 - 유머 게시판 이동하기</a>
   <br>
   <br>
   <a href="/usr/shorts/m.shortsList?boardId=3">모바일 버전 - 쇼츠 게시판 이동하기</a>
  </div>
  <img src="/img/appicon(popup).png" style="width:50%; height:50%; margin-top: 30px; margin-left:20%;"/>
</section>

<div style="margin-top:30%;">
<%@ include file="../common/foot.jspf"%>
</div>
</div>