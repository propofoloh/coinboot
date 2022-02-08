<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:set var="pageTitle" value="로그인" />
<%@ include file="../common/head.jspf"%>

<section class="mt-5">
  <div class="container mx-auto px-3">
    <form class="table-box-type-1" method="POST" action="../member/doLogin">
      <table>
        <colgroup>
          <col width="200" />
        </colgroup>
        <tbody>
          <tr>
            <th>로그인아이디</th>
            <td>
              <input name="loginId" class="w-96 input input-bordered" style="width: 100%" type="text" placeholder="로그인아이디" />
            </td>
          </tr>
          <tr>
            <th>로그인비밀번호</th>
            <td>
              <input name="loginPw" class="w-96 input input-bordered" style="width: 100%" type="password" placeholder="로그인비밀번호" />
            </td>
          </tr>
        </tbody>
      </table>
      	<div style="margin-top:10px; text-align: center;">
     	  <a href="../member/join">회원가입</a>
	       <div style="margin-top:10px; text-align: center;">
	         <button type="submit" class="btn btn-primary">로그인</button>
	         <button type="button" class="btn btn-outline btn-secondary" onclick="history.back();">뒤로가기</button>
	       </div>
	    </div>
    </form>
  </div>
</section>

<%@ include file="../common/foot.jspf"%>