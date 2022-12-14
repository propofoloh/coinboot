<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="../css.css">

<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-5Q5YC9JJPE"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-5Q5YC9JJPE');
</script>

<!-- 애드센스 
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-1107226096880396"
     crossorigin="anonymous"></script>
     -->
</head>

<div class="container">
<div id='wrapper'>

<%@ include file="../common/head.jspf"%>
<%@ include file="../common/noticPopup.jsp"%>

<section class="mt-5" style="font-size: 25px;">
      <table class="table" style="table-layout: fixed;">
        <colgroup>
          <col width="20%" />
          <col width="75%" />
          <col width="15%" />
          <col width="25%" />
          <col width="25%" />
        </colgroup>
        <thead>
          <tr style="text-align: center; font-size: 0.8em">
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">조회수</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
          </tr>
        </thead>
        <tbody style="text-align: center;">
        <!-- 
        	<tr>
        	</tr>
        -->
        	<tr>
        		<td colspan="5">
        		<!-- 
					<ins class="adsbygoogle"
					     style="display:block"
					     data-ad-format="fluid"
					     data-ad-layout-key="-hq-h+2d-1q-1n"
					     data-ad-client="ca-pub-1107226096880396"
					     data-ad-slot="9051741745"></ins>
					<script>
					     (adsbygoogle = window.adsbygoogle || []).push({});
					</script>
					 -->
        	</tr>
        	
        
          <c:forEach var="article" items="${articles}">
            <tr>
              <th style="font-weight: normal;">${article.id}</th>
              <td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
                <a class="btn-text-link block w-full truncate" href="../article/detail?id=${article.id}&page=${page}">
                  ${article.title}
                </a>
              </td>
              <td style="font-size: 0.8em;">
              ${article.extra__writerName}
              </td>
              <td style="font-size: 0.8em;">
              ${article.hitCount}
              </td>
              <td style="font-size: 0.8em;">
              ${article.forPrintType1RegDate}
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

    <div class="page-menu mt-3" style="margin: 0 auto; width: 50%;">
      <div class="btn-group justify-center">
        <c:set var="pageMenuArmLen" value="6" />
        <c:set var="startPage" value="${page - pageMenuArmLen >= 1 ? page - pageMenuArmLen : 1}" />
        <c:set var="endPage" value="${page + pageMenuArmLen <= pagesCount ? page + pageMenuArmLen : pagesCount}" />
       
        <c:set var="pageBaseUri" value="?boardId=${boardId}" />
        <c:set var="pageBaseUri" value="${pageBaseUri}&searchKeywordTypeCode=${param.searchKeywordTypeCode}" />
        <c:set var="pageBaseUri" value="${pageBaseUri}&searchKeyword=${param.searchKeyword}" />
        
        <c:if test="${startPage > 1}">
          <a class="btn btn-primary btn-lg" href="${pageBaseUri}&page=1">1</a>
          <c:if test="${startPage > 2}">          
            <a class="btn btn-primary btn-lg disabled">...</a>
          </c:if>
        </c:if>
        <c:forEach begin="${startPage}" end="${endPage}" var="i">
          <a class="btn btn-primary btn-lg ${page == i ? 'active' : ''}" href="${pageBaseUri}&page=${i}">${i}</a>          
        </c:forEach>
        <c:if test="${endPage < pagesCount}">
          <c:if test="${endPage < pagesCount - 1}">
            <a class="btn btn-primary btn-lg disabled">...</a>
          </c:if> 
          <a class="btn btn-primary btn-lg" href="${pageBaseUri}&page=${pagesCount}">${pagesCount}</a>
        </c:if>
       </div>
      </div>

    <div class="flex" style="margin-bottom: 20px; margin-top: 20px; margin-left: 10px;">
      <div class="flex-grow"></div>
      <form class="flex">
        <input type="hidden" name="boardId" value="${param.boardId}" />
      
        <select data-value="${param.searchKeywordTypeCode}" name="searchKeywordTypeCode" class="select select-bordered">
          <option disabled="disabled">검색타입</option>
          <option value="title">제목</option>
          <option value="body">내용</option>
          <option value="title,body">제목,내용</option>
        </select>
        
        <input name="searchKeyword" type="text" class="ml-2 w-72 input input-bordered" style="margin-top:10px;  width:60%;"
         placeholder="검색어" maxlength="20" value="${param.searchKeyword}" />
        
        <button type="submit" class="ml-2 btn btn-primary">검색</button>
      </form>
    </div>
</section>

<%@ include file="../common/foot.jspf"%>
</div>
</div>

<script type="text/javascript">
window.pagObj = $('#pagination').twbsPagination({
    totalPages: [[${dataListPage.totalPages}]], // 전체 페이지
    startPage: parseInt([[${dataListPage.number}]] + 1), // 시작(현재) 페이지
    visiblePages: 10, // 최대로 보여줄 페이지
    prev: "‹", // Previous Button Label
    next: "›", // Next Button Label
    first: '«', // First Button Label
    last: '»', // Last Button Label
    onPageClick: function (event, page) { // Page Click event
        console.info("current page : " + page);
    }
}).on('page', function (event, page) {
    searchDataList(page);
});
</script>

