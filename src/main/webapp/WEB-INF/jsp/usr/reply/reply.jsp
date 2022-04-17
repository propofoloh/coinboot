<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- alert 창 디자인 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>

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
  <div class="container">

    <c:if test="${rq.logined}">
      <form class="table-box-type-1" method="POST" action="../reply/doWrite"
        onsubmit="ReplyWrite__submitForm(this); return false;">
        <input type="hidden" name="relTypeCode" value="article" />
        <input type="hidden" name="relId" value="${article.id}" />
        <div>
                <textarea name="body" rows="2" placeholder="내용" style="width:80%;"></textarea>
                <button type="submit" class="btn btn-primary" style="float: right; margin-top: 10px;">댓글작성</button>
        </div>
      </form>
    </c:if>
    <c:if test="${rq.notLogined}">
      <a class="link link-primary" href="/usr/member/login">로그인</a> 후 이용해주세요.
    </c:if>
  </div>
</section>

<section>
  <div style="margin-top: 20px;">
    <h6>댓글 (${replies.size()})</h6>

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
          	
          	<div class="guideBox" style="font-size: 14px;">
			  <p><span class="textbtn">[댓글 숨기기]</span></p>
			  <div>
          		${reply.forPrintBody}
          	</div>
          	</div>
          	</td>
          	
            <td style="font-size: 12px;" colspan="2">
            	${reply.forPrintType1RegDate}
            	<br>
              <c:if test="${reply.extra__actorCanModify}">
                <a href="../reply/modify?id=${reply.id}" style="color: blue;">수정</a>
              </c:if>
              <c:if test="${reply.extra__actorCanDelete}">
                <a onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) return false;"
                  href="../reply/doDelete?id=${reply.id}" style="color: blue;">삭제</a>
              </c:if>
				<c:if test="${rq.isLogined()}">
			        <a class="btn btn-link" onclick="if ( confirm('작성자를 차단 하시겠습니까?') == false ) return false;"
			          href="../article/doMemberBlind?memberId=${article.memberId}">작성자 차단</a>
				</c:if>
              <c:if test="${reply.extra__actorCanDelete or rq.loginedMember.authLevel == '7'}">
                <a onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) return false;"
                  href="../reply/doDelete?id=${reply.id}" style="color: blue;">삭제 [관리자]</a>
              </c:if>
              
	   	      <c:choose>
			      <c:when test="${rq.isLogined()}">
				      <%@ include file="../common/replyDeclaration.jsp"%>
			      </c:when>
			      <c:when test="${!rq.isLogined()}">
				      <img src="/img/siren.png" id="reply_confirmStart" style="cursor:pointer;" />
			      </c:when>
		      </c:choose>

            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    </div>
    </section>
    
<script type="text/javascript">
$().ready(function () {
	  $("#reply_confirmStart").click(function () {
		    Swal.fire({
		      title: '댓글 신고를 위해서 로그인이 필요해요.',
		      text: "로그인을 진행 할까요?",
		      icon: 'warning',
		      showCancelButton: true,
		      confirmButtonColor: '#3085d6',
		      cancelButtonColor: '#d33',
		      confirmButtonText: '로그인',
		      cancelButtonText: '취소',
		      reverseButtons: true, // 버튼 순서 거꾸로
		      
		    }).then((result) => {
		      if (result.isConfirmed) {
		         window.location.href = 'https://dongga.ga/usr/member/login';
		      }
		    })
		  });
});
</script>

   <script>
   $(document).on("click",".guideBox > p",function(){
	      if($(this).next().css("display")=="none"){
	        $(this).next().show();
	        $(this).children("span").text("[댓글 숨기기]");
	      }else{
	        $(this).next().hide();
	        $(this).children("span").text("[댓글 보기]");
	      }
	});
   </script>