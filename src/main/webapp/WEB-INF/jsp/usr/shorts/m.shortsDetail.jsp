<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no, maximum-scale=1.0, user-scalable=no">

<!-- 카톡, 네이버 -->
<meta property="og:title" content="${shorts.title}" /> <!--웹페이지 title -->
<meta property="og:url" content="dongga.net"> <!--웹페이지 URL -->
<meta property="og:type" content="website" />
<meta property="og:image" content="/img/appicon(popup).png" /> 
<meta property="og:description" content="재미있는 각종 유머글 모음 사이트, 유머 사이트 추천, 심심할 때,유머 모음, 재밌는 글, 유머 게시판" /> 

<link rel="stylesheet" href="../css.css">

<!-- 애드센스 -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-1107226096880396"
     crossorigin="anonymous"></script>
     
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
    
    $.get('../shorts/doIncreaseHitCountRd', {
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
.bottom_menu { 
	position: fixed; 
	bottom: 0px; 
	left: 0px; 
	width: 100%; 
	height: 40px; 
	z-index:100; 
	border-top: 1px solid black; 
	background-color: white 
}
.bottom_menu > div { 
	float: left; 
	width: 20%; 
	height: 100%; 
	text-align: center; 
	padding-top: 0px; 
}
.bottom_ad { 
	position: fixed; 
	bottom: 30px; 
	left: 0px; 
	width: 100%; 
	height: 50px; 
	z-index:100; 
	border-top: 1px solid black; 
	background-color: white;
	margin-bottom: 9px;
}
</style>

<%@ include file="../common/m.head.jspf"%>
<%@ include file="../common/noticPopup.jsp"%>

<div class="">

  <div style="width:95%; margin : 0 auto; text-align:center;">
    <div class="table-box-type-1" style="font-size: 25px;">
    	<div>
    		${shorts.title}
    	</div>
    	<div  style="font-size:10px;">
    		${shorts.extra__writerName}  
    		${shorts.forPrintType2RegDate} 
    		조회수 : ${shorts.hitCount}
    	</div>
    	<hr style="border: solid 1px gray;">
<br>
		<div style="float: right;">
		
		<c:if test="${rq.isLogined()}">
	        <a class="btn btn-link" onclick="if ( confirm('작성자를 차단 하시겠습니까?') == false ) return false;"
	          href="../shorts/doMemberBlind?memberId=${shorts.memberId}">작성자 차단</a>
		</c:if>
    	  <c:if test="${rq.isLogined()}">
	        <a class="btn btn-link" onclick="if ( confirm('불량 사용자를 신고를 하시겠습니까?') == false ) return false;"
	          href="../shorts/doMemberBlind?memberId=${shorts.memberId}">불량 사용자 신고</a>
	      </c:if>
	      <c:if test="${shorts.extra__actorCanModify}">
	        <a class="btn btn-link" href="../shorts/modify?id=${shorts.id}">게시물 수정</a>
	      </c:if>
	      <c:if test="${shorts.extra__actorCanDelete}">
	        <a class="btn btn-link" onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) return false;"
	          href="../shorts/doDelete?id=${shorts.id}">게시물 삭제</a>
	      </c:if>
    	  <c:if test="${shorts.extra__actorCanDelete or rq.loginedMember.authLevel == '7'}">
	        <a class="btn btn-link" onclick="if ( confirm('불량 게시물을 삭제하시겠습니까?') == false ) return false;"
	          href="../shorts/doDelete?id=${shorts.id}">불량 게시물 삭제 및 차단[관리자]</a>
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
              
		<div style="margin-top: 50px; font-size: 15px;">
<!-- 애드핏 -->
<ins class="kakao_ad_area" style="display:none;"
data-ad-unit = "DAN-dB4AAxewhwwSBGKY"
data-ad-width = "300"
data-ad-height = "250"></ins>
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>

              		 ${shorts.forPrintBody}

<!-- 애드핏 -->
<ins class="kakao_ad_area" style="display:none;"
data-ad-unit = "DAN-Jg8NF50cbip1SULj"
data-ad-width = "320"
data-ad-height = "100"></ins>
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

		<div id="contents">
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
<!-- <a href="/usr/shorts/list?boardId=2">목록</a> -->
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
          <c:forEach var="shorts" items="${articles}">
            <tr>
              <th style="font-weight: normal;">${shorts.id}</th>
              <td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
                <a href="../shorts/m.shortsDetail?id=${shorts.id}&page=${page}">
                  ${shorts.title}
                </a>
              </td>
              <td style="font-size: 0.8em;">
              ${shorts.forPrintType1RegDate}
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      
    <div class="page-menu mt-3" style="margin-left: 10px; width: 50%;">
      <div class="btn-group justify-center">
        <c:set var="pageMenuArmLen" value="3" />
        <c:set var="startPage" value="${page - pageMenuArmLen >= 1 ? page - pageMenuArmLen : 1}" />
        <c:set var="endPage" value="${page + pageMenuArmLen <= pagesCount ? page + pageMenuArmLen : pagesCount}" />
       
        <c:set var="pageBaseUri" value="m.list?boardId=5" />
        <c:set var="pageBaseUri" value="${pageBaseUri}&searchKeywordTypeCode=${param.searchKeywordTypeCode}" />
        <c:set var="pageBaseUri" value="${pageBaseUri}&searchKeyword=${param.searchKeyword}" />
        
        <c:if test="${startPage > 1}">
          <a class="btn btn-primary btn-sm" href="${pageBaseUri}&page=1">1</a>
          <c:if test="${startPage > 2}">          
            <a class="btn btn-primary btn-sm disabled">...</a>
          </c:if>
        </c:if>
        <c:forEach begin="${startPage}" end="${endPage}" var="i">
          <a class="btn btn-primary btn-sm ${page == i ? 'active' : ''}" href="${pageBaseUri}&page=${i}">${i}</a>          
        </c:forEach>
        <c:if test="${endPage < pagesCount}">
          <c:if test="${endPage < pagesCount - 1}">
            <a class="btn btn-primary btn-sm disabled">...</a>
          </c:if> 
          <a class="btn btn-primary btn-sm" href="${pageBaseUri}&page=${pagesCount}">${pagesCount}</a>
        </c:if>
       </div>
      </div>
</div>

<!-- 하단 버튼 -->

	<div class="bottom_ad">
<!-- 애드핏
<ins class="kakao_ad_area" style="display:none;"
data-ad-unit = "DAN-rJHzRSsW6ZKje7Ak"
data-ad-width = "320"
data-ad-height = "50"></ins>
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
-->
<!-- 동까net하단광고 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:100%;height:50px"
     data-ad-client="ca-pub-1107226096880396"
     data-ad-slot="6012089010"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>

	</div>
	
	<div class="bottom_menu">
		<div>
			<img onclick="history.back()" src="/img/back.png"/>
		</div>
		
		<div>
			<c:if test="${nextArticleId != null}">
				 <a href="../shorts/m.shortsDetail?id=${nextArticleId}&page=${page}" style="margin-left: 25%;">
					<img src="/img/up.png"/>
				 </a>
			</c:if>
		</div>
		
		<div>
			<c:if test="${previousArticleId != null}">
				 <a href="../shorts/m.shortsDetail?id=${previousArticleId}&page=${page}" style="margin-left: 40%;">
					<img src="/img/down.png"/>					 
				 </a>
			</c:if>
		</div>
		
		<div>
			<a href="/usr/member/myPage">
				<img src="/img/face.png"/>
			</a>
		</div>
		
		<div>
			<img src="/img/setting.png" />
		</div>
	</div>
<%@ include file="../common/foot.jspf"%>
</div>

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
    var sendUrl = "https://dongga.net/usr/shorts/m.shortsDetail?id=" + ${shorts.id} ; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}
</script>

<script type="text/javascript">
function shareFacebook() {
    var sendUrl = "https://dongga.net/usr/shorts/m.shortsDetail?id=" + ${shorts.id} ; // 전달할 URL
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
      //imageUrl: "https://dongga.net/usr/shorts/shortsDetail?id=" + ${shorts.id}, // 콘텐츠 URL
    		  
      title: $('meta[property="og:title"]').attr( 'content' ),
      description: $('meta[property="og:description"]').attr( 'content' ),
      imageUrl: $( 'meta[property="og:image"]' ).attr( 'content' ),
      link: {
         mobileWebUrl: "https://dongga.net/usr/shorts/m.shortsDetail?id=" + ${shorts.id},
         webUrl: "https://dongga.net/usr/shorts/shortsDetail?id=" + ${shorts.id}
      }
    }
  });
}
</script>