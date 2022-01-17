<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
textarea{
	width:90%;
	border: 2px solid;
    resize:none;/* 크기고정 */ 
/*   resize: horizontal; // 가로크기만 조절가능 
	resize: vertical;  세로크기만 조절가능  */
}

</style>

<script>
  // 댓글작성 관련
  let ReplyWrite__submitFormDone = false;
  function ReplyWrite__submitForm(form) {
    if (ReplyWrite__submitFormDone) {
      return;
    }
    
    // 좌우공백 제거
    form.body.value = form.body.value.trim();
    
    if (form.body.value.length == 0) {
      alert('댓글을 입력해주세요.');
      form.body.focus();
      return;
    }
    
    if (form.body.value.length < 2) {
      alert('댓글내용을 2자이상 입력해주세요.');
      form.body.focus();
      return;
    }
    
    ReplyWrite__submitFormDone = true;
    form.submit();
  }
</script>

<section>
  <div class="container mx-auto px-3">

    <c:if test="${rq.logined}">
      <form class="table-box-type-1" method="POST" action="../reply/doWrite"
        onsubmit="ReplyWrite__submitForm(this); return false;">
        <input type="hidden" name="relTypeCode" value="article" />
        <input type="hidden" name="relId" value="${article.id}" />
        <div>
                <textarea name="body" rows="2" placeholder="내용"></textarea>
                <button type="submit" class="btn btn-primary" style="float: right;">댓글작성</button>
        </div>
      </form>
    </c:if>
    <c:if test="${rq.notLogined}">
      <a class="link link-primary" href="/usr/member/login">로그인</a> 후 이용해주세요.
    </c:if>
  </div>
</section>

<section class="mt-5">
  <div class="container mx-auto px-3">
    <h1>댓글 (${replies.size()})</h1>

    <table class="table table-fixed w-full">
      <colgroup>
        <col width="60%" />
        <col width="40%" />
        <col />
      </colgroup>
      <tbody>
        <c:forEach var="reply" items="${replies}">
          <tr class="align-top">
          	<td style="width: 80%;">
          	<div style="color: blue; font-size: 15px; font-weight: bold">
          		${reply.extra__writerName}
          	</div>
          	<div style="font-size: 13px;">
          		${reply.forPrintBody}
          	</div>
          	</td>
            <td style="font-size: 12px;">
            	${reply.forPrintType1RegDate} - 
              <c:if test="${reply.extra__actorCanModify}">
                <a href="../reply/modify?id=${reply.id}" style="color: blue;">수정</a>
              </c:if>
              <c:if test="${reply.extra__actorCanDelete}">
                <a onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) return false;"
                  href="../reply/doDelete?id=${reply.id}" style="color: blue;">삭제</a>
              </c:if>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    </div>
    </section>
    