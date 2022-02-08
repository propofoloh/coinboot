<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:set var="pageTitle" value="회원가입" />
<%@ include file="../common/head.jspf"%>

<section class="mt-5">
  <div class="container mx-auto px-3">
    <form class="table-box-type-1" method="POST" action="../member/doJoin">
      <table>
        <colgroup>
          <col width="200" />
        </colgroup>
        <tbody>
          <tr>
            <th>로그인아이디</th>
            <td>
              <input name="loginId" class="w-96 input input-bordered" type="text" placeholder="로그인아이디를 입력해주세요." />
            </td>
          </tr>
          <tr>
            <th>로그인비밀번호</th>
            <td>
              <input name="loginPw" class="w-96 input input-bordered" type="password" placeholder="로그인비밀번호를 입력해주세요." />
            </td>
          </tr>
          <tr>
            <th>이름</th>
            <td>
              <input name="name" class="w-96 input input-bordered" type="text" placeholder="이름을 입력해주세요." />
            </td>
          </tr>
          <tr>
            <th>별명</th>
            <td>
              <input name="nickname" class="w-96 input input-bordered" type="text" placeholder="별명을 입력해주세요." />
            </td>
          </tr>
          <tr>
            <th>휴대전화번호</th>
            <td>
              <input name="cellphoneNo" class="w-96 input input-bordered" type="text" placeholder="휴대전화번호를 입력해주세요." />
            </td>
          </tr>
          <tr>
            <th>이메일</th>
            <td>
              <input name="email" class="w-96 input input-bordered" type="email" placeholder="이메일을 입력해주세요." />
            </td>
          </tr>
          <tr>
            <th>회원가입</th>
            <td>
              <button type="submit" class="btn btn-primary">회원가입</button>
              <button type="button" class="btn btn-outline btn-secondary" onclick="history.back();">뒤로가기</button>
            </td>
          </tr>
        </tbody>
      </table>
    </form>
  </div>
</section>

<%@ include file="../common/foot.jspf"%>