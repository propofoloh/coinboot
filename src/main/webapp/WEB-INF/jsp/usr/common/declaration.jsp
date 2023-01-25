<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko" class="light" data-theme="light">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>신고</title>
 </head>

<style type="text/css">
 
   #pop{
    background:#3d3d3d; color:#fff; 
    position:absolute; top:10px; float:center; text-align:center; 
    border:2px solid #000;
    margin-top:100px;
    z-index: 2;position:absolute;
    font-size: 0.5em;
   }
 
   #pop_bt{
    cursor: pointer;
    padding:5px;
   }
 
   #close{
    width:30%; margin:auto; cursor:pointer; font-weight:bold;
    z-index: 2;position:absolute;
    font-size: 0.5em;
   }
   #declarationSubmit{
    width:30%; margin:auto; cursor:pointer; font-weight:bold;
    font-size: 0.5em;
   }
 </style>

 <script src="http://code.jquery.com/jquery-latest.js"></script>

 <script type="text/javascript">
   $(document).ready(function() {
    $('#pop_bt').click(function() {
     $('#pop').show();
    });

    $('#close').click(function() {
     $('#pop').hide();
    });
   });
 </script>

 </head>

 <body>

  <a id="pop_bt" class="btn btn-link">게시물 신고</a>

  <div id="pop" style="display:none;">
    <div>
    	<div id="title">
    		게시물 신고
    	</div>
    	</br>
    	<div id="content"> 신고 사유 : 
			<select name="declaration" style="width:100px;">
				<option value="">욕설 · 명예훼손</option>
				<option value="">음란물 · 선정성</option>
				<option value="">저작권 위반</option>
				<option value="">중복 게시물</option>
				<option value="">기타</option>
			</select>
			<textarea rows="6" style="margin-top: 10px;"></textarea>
			<div style="margin-top: 10px; margin-right: 30px; margin-bottom:10px;">
		    	<button type="submit" id="declarationSubmit" class="ml-2 btn btn-primary">제출</button>
		    	<button type="button" id="close" class="ml-2 btn btn-primary">취소</button>
	    	</div>
		</div>
    </div>
  </div>

 

 </body>

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

</html>
