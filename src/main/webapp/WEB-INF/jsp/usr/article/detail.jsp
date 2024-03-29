<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no, maximum-scale=1.0, user-scalable=no">

<!-- 카톡, 네이버 -->
<meta property="og:title" content="${article.title}" /> <!--웹페이지 title -->
<title>${article.title}</title>
<meta property="og:url" content="dongga.net"> <!--웹페이지 URL -->
<meta property="og:type" content="website" />
<meta property="og:image" content="/img/appicon(popup).png" /> 
<meta property="og:description" name="description" content="${article.title}, 재미있는 각종 유머글 모음 사이트, 유머 사이트 추천, 심심할 때,유머 모음, 재밌는 글, 유머 게시판" /> 

<link rel="stylesheet" href="../css.css">

<!-- 카톡 공유 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
    top: 0px;
    right: 0px;
    bottom: 0px;
    left: 0px;
    max-height: 100%;
    max-width: 100%;
}
a:hover {
  color : red;
}
a:active {
  color : green
}
</style>

<%@ include file="../common/head.jspf"%>
<%@ include file="../common/noticPopup.jsp"%>

  <div style="width:90%; margin : 0 auto; text-align:center; z-index: 1; position:relative;">
    <div class="table-box-type-1" style="font-size: 25px;">
    	<div id="title">
    		${article.title}
    	</div>
    	<div  style="font-size:10px;">
    		${article.extra__writerName}  
    		${article.forPrintType2RegDate} 
    		조회수 : ${article.hitCount}
    	</div>
    	<hr style="border: solid 1px gray;">
<br>
		<div style="text-align: right;">
		<c:if test="${rq.isLogined()}">
	        <a class="btn btn-link" onclick="if ( confirm('작성자를 차단 하시겠습니까?') == false ) return false;"
	          href="../article/doMemberBlind?memberId=${article.memberId}">작성자 차단</a>
		</c:if>
    	  <c:if test="${rq.isLogined()}">
	        <a class="btn btn-link" onclick="if ( confirm('불량 사용자를 신고를 하시겠습니까?') == false ) return false;"
	          href="../article/doMemberBlind?memberId=${article.memberId}">불량 사용자 신고</a>
	      </c:if>
	      <c:if test="${article.extra__actorCanModify}">
	        <a class="btn btn-link" href="../article/modify?id=${article.id}">게시물 수정</a>
	      </c:if>
	      <c:if test="${article.extra__actorCanDelete}">
	        <a class="btn btn-link" onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) return false;"
	          href="../article/doDelete?id=${article.id}">게시물 삭제</a>
	      </c:if>
    	  <c:if test="${article.extra__actorCanDelete or rq.loginedMember.authLevel == '7'}">
	        <a class="btn btn-link" onclick="if ( confirm('불량 게시물을 삭제하시겠습니까?') == false ) return false;"
	          href="../article/doDelete?id=${article.id}">불량 게시물 삭제 및 차단[관리자]</a>
	      </c:if>
	      
	      <c:choose>
		      <c:when test="${rq.isLogined()}">
			      <%@ include file="../common/declaration.jsp"%>
		      </c:when>
		      <c:when test="${!rq.isLogined()}">
			      <a class="btn btn-link" id="confirmStart" style="cursor:pointer">게시물 신고</a>
		      </c:when>
	      </c:choose>
		</div>

             <div>
				<!-- 동까유머 디스플레이 광고 
				<ins class="adsbygoogle"
				     style="display:block"
				     data-ad-client="ca-pub-1107226096880396"
				     data-ad-slot="6023335298"
				     data-ad-format="auto"
				     data-full-width-responsive="true"></ins>
				<script>
				     (adsbygoogle = window.adsbygoogle || []).push({});
				</script>
				-->
              </div>
              
		<div id="contents" name="contents" style="margin-top: 50px; font-size: 15px;">
<!-- 애드핏 -->
<ins class="kakao_ad_area" style="display:none;"
data-ad-unit = "DAN-dB4AAxewhwwSBGKY"
data-ad-width = "300"
data-ad-height = "250"></ins>
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
		
              		 ${article.forPrintBody}

<!-- 애드핏 -->
<ins class="kakao_ad_area" style="display:none;"
data-ad-unit = "DAN-dB4AAxewhwwSBGKY"
data-ad-width = "300"
data-ad-height = "250"></ins>
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
              		 
		</div>
		
              <div>
				<!-- 동까유머 인피드 광고 
				<ins class="adsbygoogle"
				     style="display:block"
				     data-ad-format="fluid"
				     data-ad-layout-key="-62+c8+1z-16+aw"
				     data-ad-client="ca-pub-1107226096880396"
				     data-ad-slot="8849357920"></ins>
				<script>
				     (adsbygoogle = window.adsbygoogle || []).push({});
				</script>
				-->
              </div>
<br>
<br>
<br>

		<div id="sns">
			<a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();">
				<img src="/img/sns_kakao.png"/>
			</a>
			<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">
				<img src="/img/sns_facebook.png"/>
			</a>
			<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">
				<img src="/img/sns_twitter.png"/>
			</a>
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
  댓글 보기(${replies.size()})
</button>
	<div class="collapse" id="collapseExample" style="margin-bottom: 10px;">
	  <div class="well">
		<%@ include file="../reply/reply.jsp"%>
	  </div>
	</div>
</section>

<div>

	<div style="width: 100%; margin-top: 30px;">
		<c:if test="${nextArticleId != null}"> 
		 <a href="../article/detail?id=${nextArticleId}&page=${page}" style="margin-left: 25%;">이전글</a>
		</c:if>
		
		<c:if test="${previousArticleId != null}">
		 <a href="../article/detail?id=${previousArticleId}&page=${page}" style="margin-left: 40%;">다음글</a>
		</c:if> 
	</div>
 
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
        <!-- 
	       	<tr>
	       		<td colspan="3">
	       		</td>
	       	</tr>
		-->
          <c:forEach var="article" items="${articles}">
            <tr>
              <th style="font-weight: normal;">${article.id}</th>
              <td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap; color: blue;">
               <!--  <a class="btn-text-link block w-full truncate" href="../article/detail?id=${article.id}&page=${page}"> -->
               <a href="../article/detail?id=${article.id}&page=${page}">
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
      
    <div class="page-menu mt-3" style="margin: 0 auto; width: 80%;">
      <div class="btn-group justify-center">
        <c:set var="pageMenuArmLen" value="6" />
        <c:set var="startPage" value="${page - pageMenuArmLen >= 1 ? page - pageMenuArmLen : 1}" />
        <c:set var="endPage" value="${page + pageMenuArmLen <= pagesCount ? page + pageMenuArmLen : pagesCount}" />
       
        <c:set var="pageBaseUri" value="list?boardId=2" />
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
</div>


<%@ include file="../common/foot.jspf"%>

<script type="text/javascript">
$().ready(function () {
	  $("#confirmStart").click(function () {
		    Swal.fire({
		      title: '게시물 신고를 위해서 로그인이 필요해요.',
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
		         window.location.href = 'https://dongga.net/usr/member/login';
		      }
		    })
		  });
});
</script>

<script type="text/javascript">
function shareTwitter() {
    var sendText = "동까 유머 - 실시간 유머글\n#재미있는각종 #유머글모음사이트, #유머사이트추천, #심심할때, #유머모음, #재밌는글, #유머게시판, #bts, #아미, #콘서트";  // 전달할 텍스트
    var sendUrl = "https://dongga.net/usr/article/detail?id=" + ${article.id} ; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}
</script>

<script type="text/javascript">
function shareFacebook() {
    var sendUrl = "https://dongga.net/usr/article/detail?id=" + ${article.id} ; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}
</script>

<script type="text/javascript">
function shareKakao() {
 
  // 사용할 앱의 JavaScript 키 설정
  Kakao.init('c19bc6c1c3acdde0beb31291a25965e4');
 
  // 카카오링크 버튼 생성
  Kakao.Link.createDefaultButton({
    container: '#btnKakao', // 카카오공유버튼ID
    objectType: 'feed',
    content: {
      //title: "동까 유머 - 실시간 유머글", // 보여질 제목
      //description: "재미있는 각종 유머글 모음 사이트, 유머 사이트 추천, 심심할 때,유머 모음, 재밌는 글, 유머 게시판", // 보여질 설명
      //imageUrl: "https://dongga.net/usr/article/detail?id=" + ${article.id}, // 콘텐츠 URL
    		  
      title: $('meta[property="og:title"]').attr( 'content' ),
      description: $('meta[property="og:description"]').attr( 'content' ),
      imageUrl: $( 'meta[property="og:image"]' ).attr( 'content' ),
      link: {
         mobileWebUrl: "https://dongga.net/usr/article/m.detail?id=" + ${article.id},
         webUrl: "https://dongga.net/usr/article/detail?id=" + ${article.id}
      }
    }
  });
}
</script>