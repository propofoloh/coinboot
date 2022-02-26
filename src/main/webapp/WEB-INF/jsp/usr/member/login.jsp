<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:set var="pageTitle" value="로그인" />
<%@ include file="../common/head.jspf"%>

<section class="mt-5">
	<div class="container login-container">
		<div class="col-md-6 login-form-1">
		    <form class="table-box-type-1" method="POST" action="../member/doLogin">
		        <div class="form-group">
		            <input name="loginId" type="text" class="form-control" placeholder="아이디"/>
		        </div>
		        <div class="form-group">
		            <input name="loginPw" type="password" class="form-control" placeholder="패스워드"/>
		        </div>
		        <div class="form-group" style="text-align: center;">
		            <button type="submit" class="btn btn-primary">로그인</button>
		            <button type="button" class="btn btn-outline btn-secondary" onclick="history.back();">뒤로가기</button>
		        </div>
		        <div class="form-group" style="text-align: center;">
		            <!-- <a href="#" class="ForgetPwd">비밀번호 찾기</a> -->
		            <a href="../member/join">회원가입</a>
		        </div>
		    </form>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>