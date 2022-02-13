<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:set var="pageTitle" value="자유 게시판" />
<%@ include file="../common/head.jspf"%>

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

<section class="mt-5">
  <div class="container mx-auto px-3">
    <div class="table-box-type-1">
    	<div>
    		${article.title}
    	</div>
    	<div  style="font-size:12px;">
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

		<div style="margin-top: 30px;">
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

<section class="mt-5">
    <div class="mt-3">
      <table class="table table-fixed w-full">
        <colgroup>
          <col width="50px" />
          <col width="50%" />
          <col width="30%" />
          <col width="100px" />
          <col width="10%" />
          <col />
        </colgroup>
        <thead>
          <tr style="text-align: center;">
            <th>번호</th>
            <th>제목</th>
            <th>작성날짜</th>
            <th>조회</th>
            <th>작성자</th>
          </tr>
        </thead>
        <tbody style="text-align: center;">
          <c:forEach var="article" items="${articles}">
            <tr>
              <th>${article.id}</th>
              <td>
                <a class="btn-text-link block w-full truncate" href="../article/detail?id=${article.id}">
                  ${article.title}
                </a>
              </td>
              <td>${article.forPrintType1RegDate}</td>
              <td>${article.hitCount}</td>
              <td>${article.extra__writerName}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
</section>

<section class="mt-5">
<div style="margin-bottom: 10px;">
	<%@ include file="../reply/reply.jsp"%>
</div>
</section>

<%@ include file="../common/foot.jspf"%>