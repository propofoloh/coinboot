<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:set var="pageTitle" value="게시물 작성" />
<%@ include file="../common/head.jspf"%>

<div id='wrapper' style="">

<section class="mt-5">
  <div class="container mx-auto px-3">
    <form class="table-box-type-1" id="WriteForm" method="POST" action="../article/doWrite">
      <table style="width:100%;">
        <colgroup>
          <col width="200" />
        </colgroup>
        <tbody style="width: 80%">
          <tr>
            <th>작성자</th>
            <td>
              ${rq.loginedMember.nickname}
            </td>
          </tr>
          <tr>
            <th>게시판</th>
            <td>
              <select class="select select-bordered" name="boardId" id="boardId">
                <option selected disabled>게시판을 선택해주세요.</option>
                <option value="1">공지</option>
                <option value="2">유머</option>
                <option value="3">코인</option>
                <option value="4">자유</option>
                <option value="5">정보 공유</option>
              </select>
              <!--
              <label>
                공지
                <input type="radio" name="boardId" value="1" />
              </label>
              <label>
                자유
                <input type="radio" name="boardId" value="2" />
              </label>
              -->
            </td>
          </tr>
          <tr>
            <th>제목</th>
            <td>
              <input required="required"  class="w-96 input input-bordered" name="title" id="title" type="text" placeholder="제목" />
            </td>
          </tr>
          <tr>
            <th>내용</th>
            <td>
		      <div id="smarteditor">
		        <textarea required="required" class="w-full textarea textarea-boardered" name="body" id="body" 
		                  rows="10" cols="10" 
		                  placeholder="내용을 입력해주세요"
		                  style="width: 500px"></textarea>
		      </div>
            </td>
          </tr>
          <tr>
            <th>작성</th>
            <td>
              <button type="submit" id="ok" class="btn btn-primary">작성</button>
              <button type="button" class="btn btn-secondary btn-outline" onclick="history.back();">뒤로가기</button>
            </td>
          </tr>
        </tbody>
      </table>
    </form>
    
    <div class="btns">
      
    </div>
  </div>
</section>

<%@ include file="../common/foot.jspf"%>
</div>

<script>
let oEditors = []

smartEditor = function() {
  console.log("Naver SmartEditor")
  nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "body",
    sSkinURI: "/smarteditor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
  })
}

$(document).ready(function() {
  smartEditor()
})

	$(function() {
		$("#ok").click(function() {
			oEditors.getById["body"].exec("UPDATE_CONTENTS_FIELD", []); 
			//textarea의 id를 적어줍니다.

			var boardId = $("#boardId > option:selected").val();
			var title = $("#title").val();
			var body = document.getElementById("body").value;;

			if (boardId == "") {
				alert("카테고리를 선택해주세요.");
				return;
			}
			if (title == null || title == "") {
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return;
			}
			if(body == "" || body == null || body == '&nbsp;' || 
					body == '<br>' || body == '<br/>' || body == '<p>&nbsp;</p>'){
				alert("본문을 작성해주세요.");
				oEditors.getById["body"].exec("FOCUS"); //포커싱
				return;
			} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다.
			
			var result = confirm("발행 하시겠습니까?");
			
			if(result){
				alert("발행 완료!");
				$("#WriteForm").submit();
			}else{
				return;
			}
		});
	})
  </script>