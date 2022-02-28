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
  max-width: 100%;
  height: auto;
  object-fit: cover;
}
video {
  width: 100%;
  height: auto%;
  object-fit: cover;
}
</style>

<c:set var="pageTitle" value="유머 게시판" />
<%@ include file="../common/head.jspf"%>


  <div style="width:100%; margin : 0 auto; text-align:center;">
    <div class="table-box-type-1" style="font-size: 25px;">
    	<div>
    		${article.title}
    	</div>
    	<div  style="font-size:10px;">
    		${article.extra__writerName}  
    		${article.forPrintType2RegDate} 
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

		<div style="margin-top: 50px; font-size: 15px;">
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

<section class="mt-5" style="font-size: 25px;">
<!--목록보기 -->
</section>

<section style="text-align: center;">
<button class="btn btn-primary" style="width: 90%; margin-bottom: 10px;" type="button" data-toggle="collapse" data-target="#collapseExample" 
aria-expanded="false" aria-controls="collapseExample">
  댓글 보기
</button>
	<div class="collapse" id="collapseExample" style="margin-bottom: 10px;">
	  <div class="well">
		<%@ include file="../reply/reply.jsp"%>
	  </div>
	</div>
</section>

<div>
<!-- <a href="/usr/article/list?boardId=2">목록</a> -->
      <table class="table" style="table-layout: fixed;">
        <colgroup>
          <col width="20%" />
          <col width="75%" />
          <col width="25%" />
        </colgroup>
        <thead>
          <tr style="text-align: center; font-size: 0.8em">
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성일</th>
          </tr>
        </thead>
        <tbody style="text-align: center;">
          <c:forEach var="article" items="${articles}">
            <tr>
              <th style="font-weight: normal;">${article.id}</th>
              <td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
                <a class="btn-text-link block w-full truncate" href="../article/detail?id=${article.id}">
                  ${article.title}
                </a>
              </td>
              <td style="font-size: 0.8em;">
              ${article.forPrintType1RegDate}
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      
    <div class="text-center">
        <c:set var="pageMenuArmLen" value="6" />
        <c:set var="startPage" value="${page - pageMenuArmLen >= 1 ? page - pageMenuArmLen : 1}" />
        <c:set var="endPage" value="${page + pageMenuArmLen <= pagesCount ? page + pageMenuArmLen : pagesCount}" />
       
        <c:set var="pageBaseUri" value="list?boardId=2" />
        <c:set var="pageBaseUri" value="${pageBaseUri}&searchKeywordTypeCode=${param.searchKeywordTypeCode}" />
        <c:set var="pageBaseUri" value="${pageBaseUri}&searchKeyword=${param.searchKeyword}" />
        
        <c:if test="${startPage > 1}">
          <a class="btn btn-sm" href="${pageBaseUri}&page=1">1</a>
          <c:if test="${startPage > 2}">          
            <a class="btn btn-sm btn-disabled">...</a>
          </c:if>
        </c:if>
        <c:forEach begin="${startPage}" end="${endPage}" var="i">
          <a class="btn btn-sm ${page == i ? 'btn-active' : ''}" href="${pageBaseUri}&page=${i}">${i}</a>          
        </c:forEach>
        <c:if test="${endPage < pagesCount}">
          <c:if test="${endPage < pagesCount - 1}">
            <a class="btn btn-sm btn-disabled">...</a>
          </c:if> 
          <a class="btn btn-sm" href="${pageBaseUri}&page=${pagesCount}">${pagesCount}</a>
        </c:if>
      </div>
</div>


<%@ include file="../common/foot.jspf"%>
