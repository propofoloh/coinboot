<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko" class="light" data-theme="light">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script>
    //쿠키설정    
    function setCookie( name, value, expiredays ) {
    var todayDate = new Date();
    todayDate.setDate( todayDate.getDate() + expiredays );
    document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + todayDate.toGMTString() + ';'
    }

    //쿠키 불러오기
    function getCookie(name) 
    { 
        var obj = name + "="; 
        var x = 0; 
        while ( x <= document.cookie.length ) 
        { 
            var y = (x+obj.length); 
            if ( document.cookie.substring( x, y ) == obj ) 
            { 
                if ((endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
                    endOfCookie = document.cookie.length;
                return unescape( document.cookie.substring( y, endOfCookie ) ); 
            } 
            x = document.cookie.indexOf( " ", x ) + 1; 
            
            if ( x == 0 ) break; 
        } 
        return ""; 
    }

    //닫기 버튼 클릭시
    function closeWin(key)
    {
        if($("#todaycloseyn").prop("checked"))
        {
            setCookie('divpop'+key, 'Y' , 1 );
        }
        $("#divpop"+key+"").hide();
    }
  
    $(function(){    
        if(getCookie("divpop1") !="Y"){
            $("#divpop1").show();
        }
    });
</script>

<style>
  .divpop {
      position: absolute; z-index:999; top:50px; left:10%;
      width:350px; height:500px; border:1px solid black;background-color:yellow;display:none;
  }
  .title_area {font-weight:bold;text-align:center;width:100%; color:red; font-size:2em}
  .button_area {position:absolute;bottom:0;left:10px;} 
</style>
</head>

<body>
  <form name="notice_form">
      <div id="divpop1" class="divpop">
      	<a href="https://play.google.com/store/apps/details?id=com.a.test2&pli=1" target="_blank">
          <div class="title_area">
          	동까 유머 어플 출시!!
          </div>
        
          <div class="contents" style="width:100%; hight:100%; text-align : center;">
          	<img src="/img/appicon(popup).png" style="width:90%; hight:80%; margin-top : 5px;"/>
          	<B>Google Play 다운로드</B>
          </div>
         
           <div class="button_area">
               <input type='checkbox' name='chkbox' id='todaycloseyn' value='Y'>
               <label for="todaycloseyn">&nbsp&nbsp오늘 하루동안 보지 않기</label>
               <a href='#' onclick="javascript:closeWin(1);"><B>[닫기]</B></a>
           </div>
        </a>
      </div>
  </form>
</body>
</html>