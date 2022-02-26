<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:set var="pageTitle" value="회원가입" />
<%@ include file="../common/head.jspf"%>

<section class="mt-5">
	<div class="container login-container">
		<div class="col-md-6 login-form-1" style="text-align: center;">
		    <form class="table-box-type-1" method="POST" action="../member/doJoin">
		        <div class="form-group">
		        	<label for="loginId">아이디 </label><br>
		            <input name="loginId" class="w-96 input input-bordered" type="text" placeholder="아이디를 입력해주세요." />
		        </div>
		        <div class="form-group">
		        	<label for="loginPw">패스워드 </label><br>
		            <input name="loginPw" class="w-96 input input-bordered" type="password" placeholder="패스워드를 입력해주세요." />
		        </div>
		        <div class="form-group">
		        	<label for="name">이름 </label><br>
		            <input name="name" class="w-96 input input-bordered" type="text" placeholder="이름 입력해주세요." />
		        </div>
		        <div class="form-group">
		            <label for="nickname">닉네임 </label><br>
		            <input name="nickname" class="w-96 input input-bordered" type="text" placeholder="닉네임 입력해주세요." />
		        </div>
		        <div class="form-group">
		        	<label for="cellphoneNo">전화번호 </label><br>
		            <input name="cellphoneNo" class="w-96 input input-bordered" type="text" placeholder="전화번호를 입력해주세요." />
		        </div>
		        <div class="form-group">
		        	<label for="email">이메일 </label><br>
					<input name="email" class="w-96 input input-bordered" type="email" placeholder="이메일 입력해주세요." />
		        </div>
		        
		        <div class="form-group" style="text-align: center;">
			        <button type="submit" class="btn btn-primary">회원가입</button>
	             	<button type="button" class="btn btn-outline btn-secondary" onclick="history.back();">뒤로가기</button>
		        </div>
		    </form>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>