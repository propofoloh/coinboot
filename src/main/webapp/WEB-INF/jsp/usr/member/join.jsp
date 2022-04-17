<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:set var="pageTitle" value="회원가입" />
<%@ include file="../common/head.jspf"%>

<section class="mt-5">
	<div class="container login-container">
		<div class="login-form-1" style="text-align: center;">
		    <form class="table-box-type-1" method="POST" action="../member/doJoin" style="width:80%;">
		        <div class="form-group">
		        	<label for="loginId">아이디 </label><br>
		            <input name="loginId" class="w-96 input input-bordered" type="text" placeholder="아이디를 입력해 주세요." />
		        </div>
		        <div class="form-group">
		        	<label for="">패스워드 </label><br>
		            <input name="" class="w-96 input input-bordered" type="password" placeholder="패스워드를 입력해 주세요." />
		        </div>
		        <div class="form-group">
		        	<label for="loginPw">패스워드 확인</label><br>
		            <input name="loginPw" class="w-96 input input-bordered" type="password" placeholder="패스워드를 확인해 주세요." />
		        </div>
		        <div class="form-group">
		        	<label for="name">이름 </label><br>
		            <input name="name" class="w-96 input input-bordered" type="text" placeholder="이름 입력해 주세요." />
		        </div>
		        <div class="form-group">
		            <label for="nickname">닉네임 </label><br>
		            <input name="nickname" class="w-96 input input-bordered" type="text" placeholder="닉네임 입력해주세요." />
		        </div>
		        <div class="form-group">
		        	<label for="cellphoneNo">전화번호 </label><br>
		            <input name="cellphoneNo" class="w-96 input input-bordered" type="text" placeholder="전화번호를 입력해주세요." />
		        </div>
		        <div class="form-group">
		        	<label for="email">이메일 </label><br>
					<input name="email" class="w-96 input input-bordered" type="email" placeholder="이메일 입력해주세요." />
		        </div>
		        
<div class="checkbox_group">

<br/>
<h2>이용약관/사용자 정책</h2>
  <input type="checkbox" id="check_all" >
  <label for="check_all"><b>전체 동의</b></label>
  <br/>
  <input type="checkbox" id="check_1" class="normal" >
  <label for="check_1"><b>이용약관/개인정보 처리방침 동의</b></label>
  <div style="overflow:scroll; width:100%; height:30%; textalign:center;">
  		<p> <p class="ls2 lh6 bs5 ts4"><em class="emphasis">< 동까 유머 >('https://dongga.ga/'이하 '동까 유머')</em>은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.</p><p class="ls2">○ 이 개인정보처리방침은 <em class="emphasis">2022</em>년 <em class="emphasis">1</em>월 <em class="emphasis">1</em>부터 적용됩니다.</p></br><p class='lh6 bs4'><strong>제1조(개인정보의 처리 목적)<br/><br/><em class="emphasis">< 동까 유머 >('https://dongga.ga/'이하  '동까 유머')</em>은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.</strong></p><ul class="list_indent2 mgt10"><p class="ls2">1. 홈페이지 회원가입 및 관리</p><p class="ls2">회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 만14세 미만 아동의 개인정보 처리 시 법정대리인의 동의여부 확인, 각종 고지·통지, 고충처리 목적으로 개인정보를 처리합니다.</p></br><p class="ls2">2. 민원사무 처리</p><p class="ls2">민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 목적으로 개인정보를 처리합니다.</p></br><p class="ls2">3. 재화 또는 서비스 제공</p><p class="ls2">물품배송, 서비스 제공, 계약서·청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금결제·정산, 채권추심을 목적으로 개인정보를 처리합니다.</p></br><p class="ls2">4. 마케팅 및 광고에의 활용</p><p class="ls2">신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 , 인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.</p></br><p class="ls2">5. 개인영상정보</p><p class="ls2">범죄의 예방 및 수사, 시설안전 및 화재예방, 교통단속, 교통정보의 수집·분석 및 제공 등을 목적으로 개인정보를 처리합니다.</p></br></ul></br></br><p class='lh6 bs4'><strong>제2조(개인정보의 처리 및 보유 기간)</strong></br></br>① <em class="emphasis">< 동까 유머 ></em>은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.</br></br>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</p><ul class='list_indent2 mgt10'><li class='tt'>1.<홈페이지 회원가입 및 관리></li><li class='tt'><홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<영구>까지 위 이용목적을 위하여 보유.이용됩니다.</li><li>보유근거 : 개인정보 처리</li><li>관련법령 : </li><li>예외사유 : </li></ul></br></br><p class='lh6 bs4'><strong>제3조(개인정보의 제3자 제공)</strong></br></br> ① <em class="emphasis">< 동까 유머 >은(는) 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.</p><p class="sub_p mgt10">②  <span class="colorLightBlue">< 동까 유머 ></span>은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.</p><ul class="list_indent2 mgt10"><li class="tt">1. < 동까 유머 관리자 ></li><li>개인정보를 제공받는 자 : 동까 유머 관리자</li><li>제공받는 자의 개인정보 이용목적 : 이메일, 휴대전화번호, 자택주소, 자택전화번호, 비밀번호 질문과 답, 비밀번호, 로그인ID, 성별, 생년월일, 이름, 회사전화번호, 직책, 부서, 회사명, 직업, 취미, 신체정보, 학력, 종교, 신용카드정보, 은행계좌정보, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록, 법정대리인 이름, 법정대리인 자택 전화번호, 법정대리인 자택 주소, 법정대리인 휴대전화번호</li><li>제공받는 자의 보유.이용기간: 영구</li></ul></br></br><p class='lh6 bs4'><strong>제4조(개인정보처리 위탁)</strong></br></br> ① <em class="emphasis">< 동까 유머 ></em>은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.</p><ul class='list_indent2 mgt10'><li class='tt'>1. <  ></li><li>위탁받는 자 (수탁자) : </li><li>위탁하는 업무의 내용 : </li><li>위탁기간 : </li></ul><p class='sub_p mgt10'>②  <span class='colorLightBlue'>< 동까 유머 ></span>은(는) 위탁계약 체결시 「개인정보 보호법」 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</p><p class='sub_p mgt10'>③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</p><br/><br/><p class="lh6 bs4"><strong>제5조(정보주체와 법정대리인의 권리·의무 및 그 행사방법)</strong></p><p class="ls2"><br/><br/>① 정보주체는 동까 유머에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.</p><p class='sub_p'>② 제1항에 따른 권리 행사는동까 유머에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 동까 유머은(는) 이에 대해 지체 없이 조치하겠습니다.</p><p class='sub_p'>③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</p><p class='sub_p'>④ 개인정보 열람 및 처리정지 요구는  「개인정보 보호법」  제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.</p><p class='sub_p'>⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</p><p class='sub_p'>⑥ 동까 유머은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.</p></br></br><p class='lh6 bs4'><strong>제6조(처리하는 개인정보의 항목 작성) </strong></br></br> ① <em class="emphasis">< 동까 유머 ></em>은(는) 다음의 개인정보 항목을 처리하고 있습니다.</p><ul class='list_indent2 mgt10'><li class='tt'>1< 홈페이지 회원가입 및 관리 ></li><li>필수항목 : 이메일, 휴대전화번호, 자택주소, 자택전화번호, 비밀번호 질문과 답, 비밀번호, 로그인ID, 성별, 생년월일, 이름, 회사전화번호, 직책, 부서, 회사명, 직업, 기념일, 결혼여부, 취미, 신체정보, 학력, 종교, 신용카드정보, 은행계좌정보, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록, 법정대리인 이름, 법정대리인 자택 전화번호, 법정대리인 자택 주소, 법정대리인 휴대전화번호</li><li>선택항목 : </li></ul></br></br><p class='lh6 bs4'><strong>제7조(개인정보의 파기)<em class="emphasis"></strong></p><p class='ls2'></br>① < 동까 유머 > 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.</br></br>② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.</br>1. 법령 근거 :</br>2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜</br></br>③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.</br>1. 파기절차</br> < 동까 유머 > 은(는) 파기 사유가 발생한 개인정보를 선정하고, < 동까 유머 > 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.</br></p><p class='sub_p mgt10'>2. 파기방법</p><p class='sub_p'>전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다</p></br></br><p class='lh6 bs4'><strong>제8조(개인정보의 안전성 확보 조치)<em class="emphasis"></br></br>< 동까 유머 ></em>은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.</strong></p><p class='sub_p mgt10'>1. 정기적인 자체 감사 실시</br> 개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.</br></br>2. 개인정보 취급 직원의 최소화 및 교육</br> 개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.</br></br>3. 내부관리계획의 수립 및 시행</br> 개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.</br></br>4. 해킹 등에 대비한 기술적 대책</br> <<em class="emphasis">동까 유머</em>>('<em class="emphasis">동까 유머</em>')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.</br></br>5. 개인정보의 암호화</br> 이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</br></br>6. 접속기록의 보관 및 위변조 방지</br> 개인정보처리시스템에 접속한 기록을 최소 1년 이상 보관, 관리하고 있으며,다만, 5만명 이상의 정보주체에 관하여 개인정보를 추가하거나, 고유식별정보 또는 민감정보를 처리하는 경우에는 2년이상 보관, 관리하고 있습니다.<br/>또한, 접속기록이 위변조 및 도난, 분실되지 않도록 보안기능을 사용하고 있습니다.</br></br>7. 개인정보에 대한 접근 제한</br> 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</br></br>8. 문서보안을 위한 잠금장치 사용</br> 개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.</br></br>9. 비인가자에 대한 출입 통제</br> 개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.</br></br></p></br></br><p class="lh6 bs4"><strong>제9조(개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항)</strong></p><p class="ls2"><br/><br/>① 동까 유머 은(는) 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.</br>② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.</br>가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.</br>나. 쿠키의 설치•운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.</br>다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.<p class='sub_p mgt30'><strong>제10조 (개인정보 보호책임자) </strong></p><p class='sub_p mgt10'> ①  <span class='colorLightBlue'>동까 유머</span> 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.</p><ul class='list_indent2 mgt10'><li class='tt'>▶ 개인정보 보호책임자 </li><li>성명 :동까 유머</li><li>직책 :관리자</li><li>직급 :관리자</li><li>연락처 : , propofoloh@gmail.com, </li></ul><p class='sub_p'>※ 개인정보 보호 담당부서로 연결됩니다.<p/> <ul class='list_indent2 mgt10'><li class='tt'>▶ 개인정보 보호 담당부서</li><li>부서명 :</li><li>담당자 :</li><li>연락처 :, , </li></ul><p class='sub_p'>② 정보주체께서는 동까 유머 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 동까 유머 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</p><p class='sub_p mgt30'><strong>제11조(개인정보 열람청구)</br> 정보주체는 ｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.<br/>< 동까 유머 ></span>은(는) 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다. </strong></p><ul class='list_indent2 mgt10'><li class='tt'>▶ 개인정보 열람청구 접수·처리 부서 </li><li>부서명 : </li><li>담당자 : </li><li>연락처 : , , </li></ul></br></br><p class='lh6 bs4'><strong>제12조(권익침해 구제방법)<em class="emphasis"></em></strong></p><br/><br/>정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.<br/><br/>

  1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr)<br/>
  2. 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)<br/>
  3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)<br/>
  4. 경찰청 : (국번없이) 182 (ecrm.cyber.go.kr)<br/><br/>

「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.<br/><br/>

※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를 참고하시기 바랍니다.</br></br><p class='lh6 bs4'><strong>제13조(개인정보 처리방침 변경)<em class="emphasis"></em></strong></p><br/></p><p class='sub_p'>① 이 개인정보처리방침은 2022년 1월 1부터 적용됩니다.</p><p class='sub_p'></p><p class='sub_p'></p><p class='sub_p'>② 이전의 개인정보 처리방침은 아래에서 확인하실 수 있습니다. </p><p class='sub_p'></p><p class='sub_p'></p><p class='sub_p'>예시 ) - 20XX. X. X ~ 20XX. X. X 적용   (클릭) </p><p class='sub_p'></p><p class='sub_p'></p><p class='sub_p'>예시 ) - 20XX. X. X ~ 20XX. X. X 적용   (클릭) </p><p class='sub_p'></p><p class='sub_p'></p><p class='sub_p'>예시 ) - 20XX. X. X ~ 20XX. X. X 적용   (클릭)</p></p>
  </div>
  <br>
  <input type="checkbox" id="check_2" class="normal" >
  <label for="check_2"><b>사용자 정책 동의</b></label>
  <div style="overflow:scroll; width:100%; height:30%; textalign:center;">
  UGC 콘텐츠가 포함된 게시글 및 다른 사용자들에게 불쾌감을 줄 수 있는 게시물을 작성 시 법적 조치 및 무통보 삭제, 차단이 될 수 있습니다.<br/>
  '동까 유머'에 일반회원이 게시한 게시물에 대한 저작권은 동까유머가 보유합니다.<br/>
  사용자가 UGC를 제작하거나 업로드하기 전에 앱의 이용약관 또는 사용자 정책을 수락하도록 해야 합니다.<br/>
Play의 개발자 프로그램 정책을 준수하는 방식으로 불쾌감을 주는 콘텐츠 및 행동을 정의하고 앱의 이용약관 또는 사용자 정책에서 이러한 콘텐츠와 행동을 금지해야 합니다.<br/>
타사용자들에게 불쾌감을 주거나 이용정책에 준수하지 않는 UGC를 업로드 할 경우 "동까 유머" 관리자가 실시간 임의로 차단하거나 제거합니다.<br/>
"동까 유머" 이용 약관 및/또는 사용자 정책을 위반하는 악의적인 사용자를 제거하거나 차단합니다.<br/>

1. "동까 유머"은 게시물(게시글/댓글) 및 내용물에 관한 세부 이용지침(공지사항)을 별도로 정하여 운영할 수 있으며 회원은 그 지침에 따라 내용을 등록하여야 합니다.<br/>
2. "동까 유머"은 공개게시물의 내용이 다음 각 호에 해당하는 경우 회원에게 사전 통지 없이 해당 공개게시물을 임시 차단 조치 또는 삭제나 이동할 수 있고, 해당 회원의 회원 자격을 제한, 정지 또는 상실시킬 수 있습니다.<br/>
① "동까 유머"에서 제공하는 서비스에 정한 약관 기타 서비스 이용에 관한 규정을 위반하는 행위<br/>
② "동까 유머" 공지사항 또는 각 게시판 공지사항에 위반하는 내용<br/>
③ 다른 회원 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용<br/>
④ 제3자의 저작권 등 권리를 침해하는 내용<br/>
⑤ 범죄행위와 관련이 있다고 판단되는 내용<br/>
⑥ 기타 관계 법령에 위배된다고 판단되는 내용<br/>
3. "동까 유머"은 회원의 게시물 등에 대하여 다른 회원 혹은 제3자의 법률상 권리 침해를 근거로 게시 중단 요청을 받은 경우 게시물을 게시 중단할 수 있으며, 게시 중단 요청자와 게시물 등록 회원간의 합의 또는 법적 조치의 결과 등이 "동까 유머"에 접수되면 그에 따릅니다.<br/>
  </div>
  <br/>
  
  <input type="checkbox" id="check_3" class="normal" >
  <label for="check_3"><b>마케팅 동의</b></label>
  <div style="overflow:scroll; width:100%; height:20%; textalign:center;">
  	마케팅 정보 수신 여부 및 마케팅을 위한 개인정보 수집이용을 거부하실 수 있으며, 거부 시에도 "동까 유머" 서비스를 이용하실 수 있으나, 동의를 거부한 경우 각종 소식 및 이벤트 참여에 제한이 있을 수 있습니다.<br/>
  	개인정보 수집 항목 - 이름, 휴대폰번호, 이메일, 주소<br/>
  	개인정보 수집 이용 목적 - 이벤트 운영 및 광고성 정보 전송, 서비스 관련 정보 전송<br/>
	보유 및 이용기간 - 이용자가 동의를 철회하거나, 탈퇴시까지 보유•이용<br/>
  </div>
</div>

		        <div class="form-group" style="text-align: center; margin-top:30px;x">
			        <button type="submit" class="btn btn-primary">회원가입</button>
	             	<button type="button" class="btn btn-outline btn-secondary" onclick="history.back();">뒤로가기</button>
		        </div>
		    </form>
		</div>
	</div>
</section>

<script type="text/javascript">
//체크박스 전체 선택
$(".checkbox_group").on("click", "#check_all", function () {
  var checked = $(this).is(":checked");

  if(checked){
  	$(this).parents(".checkbox_group").find('input').prop("checked", true);
  } else {
  	$(this).parents(".checkbox_group").find('input').prop("checked", false);
  }
});
//체크박스 개별 선택
$(".checkbox_group").on("click", ".normal", function() {
    var is_checked = true;
    
    $(".checkbox_group .normal").each(function(){
        is_checked = is_checked && $(this).is(":checked");
    });
    
    $("#check_all").prop("checked", is_checked);
});
</script>

<%@ include file="../common/foot.jspf"%>