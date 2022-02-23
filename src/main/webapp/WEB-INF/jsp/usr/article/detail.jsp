<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<script>
  const params = {};
  params.id = parseInt('${param.id}');
</script>

<script>
  function ArticleDetail__increaseHitCount() {
    const localStorageKey = 'article__' + params.id + '__viewDone';
    
    if (localStorage.getItem(localStorageKey)) {
      return;
    }
    
    localStorage.setItem(localStorageKey, true);
    
    $.get('../article/doIncreaseHitCountRd', {
        id : params.id,
        ajaxMode : 'Y'
    }, function(data) {
      $('.article-detail__hit-count').empty().html(data.data1);
    }, 'json');
  }

  $(function() {
    // 실전코드
    // ArticleDetail__increaseHitCount();
    
    // 임시코드
    setTimeout(ArticleDetail__increaseHitCount, 500);
  })
</script>

<style>
img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
video {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>

<div class="container">

<c:set var="pageTitle" value="${board.name} 게시판" />
<%@ include file="../common/head.jspf"%>

<div id='wrapper'>

<section class="mt-5">
  <div style="width:95%; margin : 0 auto; text-align:center;">
    <div class="table-box-type-1" style="font-size: 25px;">
    	<div>
    		${article.title}
    	</div>
    	<div  style="font-size:25px;">
    		${article.extra__writerName} | 
    		${article.forPrintType2RegDate} |
    		조회수 : ${article.hitCount}
    	</div>
    	<hr style="border: solid 1px gray;">
<br>
		<div style="float: right;">
	      <c:if test="${article.extra__actorCanModify}">
	        <a class="btn btn-link" href="../article/modify?id=${article.id}">게시물 수정</a>
	      </c:if>
	      <c:if test="${article.extra__actorCanDelete}">
	        <a class="btn btn-link" onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) return false;"
	          href="../article/doDelete?id=${article.id}">게시물 삭제</a>
	      </c:if>
		</div>

		<div style="margin-top: 50px;">
              		 ${article.forPrintBody}
		</div>
<br>
<br>
<br>

		<div id="contents">
			<%@ include file="../good/good.jsp"%>
		</div>
    </div>
  </div>
</section>

<section class="mt-5" style="font-size: 25px;">
<!--목록보 -->
</section>

<section class="mt-5">
<div style="margin-bottom: 10px;">
	<%@ include file="../reply/reply.jsp"%>
</div>
</section>

<%@ include file="../common/foot.jspf"%>
</div>
</div>