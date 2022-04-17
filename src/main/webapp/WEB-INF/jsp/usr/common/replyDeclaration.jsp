<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko" class="light" data-theme="light">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>댓글 신고</title>
 </head>

<style type="text/css">
 
   #reply_pop{
    width:100%; height:40%; background:#3d3d3d; color:#fff; 
    top:10px; float:center; text-align:center; 
    border:2px solid #000;
    font-size: 0.5em;
   }
 
   #reply_pop_bt{
    cursor: pointer;
    padding:5px;
   }
 
   #reply_close{
    width:5%; margin:auto; cursor:pointer; font-weight:bold;
    z-index: 2;position:absolute;
    font-size: 0.5em;
   }
   #reply_declarationSubmit{
    width:30%; margin:auto; cursor:pointer; font-weight:bold;
    font-size: 0.5em;
   }
 </style>

 <script src="http://code.jquery.com/jquery-latest.js"></script>

 <script type="text/javascript">
   $(document).ready(function() {
    $('#reply_pop_bt').click(function() {
     $('#reply_pop').show();
    });

    $('#reply_close').click(function() {
     $('#reply_pop').hide();
    });
   });
 </script>

 </head>

 <body>

  <img src="/img/siren.png" id="reply_pop_bt" style="cursor:pointer;" />

  <div id="reply_pop" style="display:none;">
    <div>
    	<div id="reply_title">
    		댓글 신고
    	</div>
    	</br>
    	<div id="reply_content"> 신고 사유 : 
			<select name="reply_declaration" style="width:100px;">
				<option value="">욕설 · 명예훼손</option>
				<option value="">음란물 · 선정성</option>
				<option value="">저작권 위반</option>
				<option value="">중복 댓글</option>
				<option value="">기타</option>
			</select>
			<textarea rows="6" style="margin-top: 10px;"></textarea>
			<div style="margin-top: 10px; margin-right: 20px;">
		    	<button type="submit" id="reply_declarationSubmit" class="ml-2 btn btn-primary">제출</button>
		    	<button type="button" id="reply_close" class="ml-2 btn btn-primary">취소</button>
	    	</div>
		</div>
    </div>
  </div>

 

 </body>

</html>
