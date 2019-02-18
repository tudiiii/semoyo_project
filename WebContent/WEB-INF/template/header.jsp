<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header">
	<ul class="header_box">
		<li class="logo"><a href="/main"><img
				src="/img/logo1.png" width="250" height="140"></a></li>
		<li class="recipe"><a href="/recipe">레시피</a></li>
		<li class="tip"><a href="/tipmain">꿀팁</a></li>
		<li class="commu"><a href="/talk">소통</a></li>
		<li class="give"><a href="/give">나눔</a></li>
		<li class="refrigerator"><img src="/img/fridge.png" width="50"
			height="50"></li>
		<li class="search_box">
			<form action="/recipe" method="get">${param.search}
				<input id="search_input" name="search" placeholder="검색할 단어를 입력하세요.">
			</form> <!--<button class="search"><img src="img/search.png" width="30" height="30"></button>-->
		</li>
		<li class="search"><i class="fas fa-search"></i></li>
		<c:choose>
			<c:when test="${loginUser==null }">
				<li class="login">로그인</li>
				<li class="join"><a href="#">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<li class="setting">
				<a> <img src="${loginUser.profile }"
						class="profile_pic" width="50" height="50"> <span
						class="profile_nickname">${loginUser.nickname }</span> <span class="bu"></span>
				</a>
					<div class="myInf">
						<ul id="myInfList">
							<li><a href="/user/mypage/${loginUser.no }">마이 페이지</a></li>
							<li>
							<form action="/session" method="post">
							<input type="hidden" name="_method" value="DELETE" />
								<button class="logout">로그아웃
							</form>
							</li>
						</ul>
						<!--//.myInfList -->
					</div>
					<!--//.myInf --></li>
				<!-- // .setting -->
				<li class="recipe_register_go"><a href="/recipeRegister"><img
				src="/img/recipeRegister.png" width="50" height="50"></a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
<div id="popup"></div>
<div id="loginPopup">
	<div id="logo">
        <img src="/img/logo4.png">
    </div>
	<div id="loginClose">
		<i class="fas fa-times"></i>
	</div>
	<form action="/session" method="post">
		<div class="login" id="id">
			<div>
				<i class="fas fa-user"></i>
			</div>
			<input name="id" placeholder="아이디를 입력하세요.">
		</div>
		<div class="login" id="pwd">
			<div>
				<i class="fas fa-key"></i>
			</div>
			<input name="password" type="password" placeholder="비밀번호를 입력하세요.">
		</div>
		<button>로그인</button>
		<div class="login">
			<a id="register" href="">회원가입</a> <a href="">아이디/비밀번호 찾기</a>
		</div>
	</form>
</div>

<!--// #login end-->


<div id="registerPopup">
	<div id="registerLogo">
		<img src="/img/logo4.png">
	</div>
    <div id="registerClose"><i class="fas fa-times"></i></div>
    <div id="joinBox">
        <form action="/user/join" method="post">
                <div id="profileRow">
                    <div id="profileBox" class="no_image">
                        <label class="profile">
                            <img src="/img/profile.png" width="140" height="140" id="profileImg"/>
                            <input type="file" name="profile" id="profile"/>
                        </label>
                    </div><!-- //profileBox -->
                </div><!--//profileRow -->
              

                <div class="row">
                    <label class="label" for="idid">아이디</label>
                    <input id="idid" name="id" placeholder="아이디를 입력해주세요" title="영어,숫자 4~20자 입력"/>
                    <div class="msg id">아이디를 입력해주세요.</div>
                </div><!--//row--> <!--아이디-->

                <div class="row">
                    <label class="label" for="pwdpwd">비밀번호</label>
                    <input type="password" id="pwdpwd" name="password" placeholder="비밀번호를 입력해주세요"/>
                    <div class="msg pwd"></div>
                </div><!--//row--> <!--pwd-->

                <div class="row">
                    <label class="label" for="confirm">비밀번호 확인</label>
                    <input type="password" id="confirm"
                           placeholder="위와 동일하게 입력"
                           title="위와 동일하게 입력"/>
                    <div class="msg confirm"></div>
                </div><!--//row--> <!--confirm-->

                <div class="row">
                    <label class="label" for="nickname">닉네임</label>
                    <input id="nickname"
                           name="nickname"
                           placeholder="별명을 입력해주세요"
                           title="4~32자로 입력"/>
                    <div class="msg nickname">별명을 입력해주세요</div>
                </div><!--//row--> <!--nickname-->

                <div class="row">
                    <span class="label" for="email">이메일</span>
                    <p id="email">
                        <label><input name="email" id="emailId" name="emailId" autocomplete="off" placeholder="이메일"/></label>
                    </p>
                    <div class="msg email"></div>
                </div><!--//row-->


                <div class="box_btn">
                    <button class="btn registerBtn" type="submit"><i class="fas fa-sign-in-alt"></i> 회원가입</button>
                    <button class="btn resetBtn" type="reset"><i class="fas fa-redo"></i> 초기화</button>
                </div><!--//box_btn -->
        </form>
    </div><!--//joinBox-->
</div>

<%--reg end--%>



<!-- 냉장고 시작 -->

<div id="refPopup">
    <h1>나의 냉장고</h1>
    <div id="searchMaterial">
        <input id=iceSearch placeholder="재료를 검색해보세요 !"/>
        <button><i class="fas fa-search"></i></button>
    </div>
    <div id="refClose"><i class="fas fa-times"></i></div>
    <div id="materialBox">
    <input type="hidden" id="mmmyyyNo" value="${loginUser.no }">
        <button class="btn leftBtn"><i class="fas fa-angle-left"></i></button>
        <div>
            <ul id="material">
                <li data-upNo="1" class="on">곡류</li>
                <li data-upNo="2">면/만두류</li>
                <li data-upNo="3">빵류</li>
                <li data-upNo="4">과자</li>
                <li data-upNo="5">떡류</li>
                <li data-upNo="6">감자/고구마류</li>
                <li data-upNo="7">묵/두부</li>
                <li data-upNo="8">콩/견과류</li>
                <li data-upNo="9">채소류</li>
                <li data-upNo="10">과일류</li>
                <li data-upNo="11">고기류</li>
                <li data-upNo="12">햄/소시지</li>
                <li data-upNo="13">계란류</li>
                <li data-upNo="14">어패류</li>
                <li data-upNo="15">해조류</li>
                <li data-upNo="16">유제품/치즈류</li>
                <li data-upNo="17">양념류</li>
                <li data-upNo="18">초콜렛/사탕</li>
                <li data-upNo="19">음료/주류</li>
            </ul>
        </div>
        <button class="btn rightBtn"><i class="fas fa-angle-right"></i></button>
    </div>
    <ul class="material field1">
        
    </ul>
    <div id="myRef">** 냉장고에 재료를 추가해 레시피를 만나보세요.</div>
    <button id="removeBtn">전체삭제</button>
    <div class="material field2">
        <form action="/recipe/main" method="get" id="lastForm">
            <ul>
            </ul>
			
        </form>
    </div>
	<button  id="goBtn">냉장go로 검색 go!</button>
    
</div>


<script type="text/template" id="atomContent">
	<@_.each(data, function(atom) {@>
    <li data-atom="<@=atom.no@>" class="<@=atom.no@>">
        <em><i class="fas fa-check-circle"></i></em>
        <img src="/img/<@=atom.image@>">
        <strong><@=atom.name@></strong>
    </li>
	<@})@>
</script>

<script type="text/template" id="addMenu">
    <@_.each(data, function(atom) {@>
    <li class="removed <@=atom.no@>">
        <label>
            <img class="no_checked on" src="/img/checked.png"/>
            <em data-atom="<@=atom.no@>"><i class="far fa-times-circle"></i></em>
            <img src="/img/<@=atom.image@>">
            <strong><@=atom.name@></strong>
            <input type="checkbox" class="check" name="atom" value="<@=atom.name@>" checked>
         <input type="hidden" value="<@=atom.no@>">
        </label>
    </li>
   <@})@>
</script>

<!-- 냉장고 종료 -->

<script src="/js/jquery.js"></script>
<script>

var $joinForm = $("#joinBox>form");

/* 정규 표현식 */

//아이디가  첫글자는 영어로, 영어와 숫자로 4~20글자까지라면
var idReg = /^[a-z|A-Z][\w]{3,19}$/;
//비밀번호가 4~32자로 영어, 숫자
var pwdReg = /^[\w]{4,32}$/;
//image인지 확인하는 정규표현식
var profileReg = /^image/;
//닉네임 정규표현식
var nicknameReg = /^[ㄱ-힣|0-9]{1,10}$/;

//id
var $id = $("#idid");
//id msg
var $idMsg = $(".msg.id");

//nickname
var $nickname = $("#nickname");
//nickname msg
var $nicknameMsg = $(".msg.nickname");

//pwd
var $pwd = $("#pwdpwd");
//pwd msg
var $pwdMsg = $(".msg.pwd");

//confirm 
var $confirm = $("#confirm");
//confirm msg
var $confirmMsg = $(".msg.confirm");

//profile input요소(type file)
var $profile = $("#profile");
//profile msg 
var $profileMsg = $(".msg.profile");
//profileName
var $profileName = $("#profileName");
//profileImg
var $profileImg = $("#profileImg");
//profileBox
var $profileBox = $("#profileBox");

//유저가 이전에 입력한 값(ajax경우 중복 요청을 막기 위해서)
var oldId = null;
var oldNickname = null;
var oldProfile = null;

//유효성검사가 되었는지 확인하는 변수
var isValidId = false;
var isValidNickname = false;
var isValidPwd = false;
var isConfirmPwd = false;

function checkConfirmPwd() {
	
	var value = $confirm.val();
	
	if(value.length!=0 && value==$pwd.val()) {
		isConfirmPwd = true;
		$confirmMsg.addClass("ok")
		           .text("비밀번호와 일치합니다.");
	}else {
		isConfirmPwd = false;
		$confirmMsg.removeClass("ok")
        .text("비밀번호와 동일하게 입력해주세요.");
		//$confirm.val("").focus();
	}//if else end
	
}//checkConfirmPwd() end

function checkProfile() {
	
	//jquery객체에서 순수자바스크립트요소객체 얻기
	var profile = $profile.get(0);
	
	//input type=file요소(순수자바스크립트)는 무조건
	//files배열을 가지고 있습니다.
	
	//한 개의 파일
	var file = profile.files[0];
		
	//File 객체의 속성
	//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
	//- name : 파일명
	//- lastModified : 최종수정일
	//- size : 파일 크기
	
	if(file==null||file.size<=0) {
		
		$profileMsg.removeClass("ok")
		           .text("제대로 된 파일을 선택해주세요.");
		
		return;
	}//if end
	
	//이미지인지 확인!!
	if(!profileReg.test(file.type)) {
		
		$profileMsg.removeClass("ok")
        .text("이미지 파일을 선택해주세요.");
		
		return;
	}else {
		
		$profileMsg.text("");
		
	}//if~else end
	
	if(oldProfile!=file.name) {
		
	oldProfile = file.name;
	
	//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
	//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
	
	//ajax로 넘길 폼을 생성하고
	var form = new FormData();
	
	//우리가 선택한 파일을 붙임
	form.append("type","P");//일반적인 데이터
	
	//1)파라미터명, 2) 파일 3) 파일명
	form.append("uploadImg",file,file.name);
	
	//multipart/form-data로 ajax처리
	$.ajax({
		url:"/ajax/upload",
		dataType:"json",
		type:"POST",//multipart/form-data
		processData:false,//multipart/form-data
		contentType:false,//multipart/form-data
		data:form,
		error:function() {
			alert("사진 서버 점검중!");
		},
		success:function(json) {
			$profileImg.attr("src",json.src);
			$profileName.val("/img/"+json.src);
			$profileBox.removeClass("no_image");
			
		}//success end
		
	});//ajax() end
	
	}//if end
	
}//checkProfile() end

//비밀번호 유효성검사하는 함수
function checkPwd() {
	
	if(pwdReg.test($pwd.val())) {
		$pwdMsg.addClass("ok").text("좋은 비밀번호입니다.");
		isValidPwd = true;
	}else {
		$pwdMsg.removeClass("ok").text("영어,숫자 4~32글자로 입력해주세요.");
		isValidPwd = false;
	}//if~else end
	
	checkConfirmPwd();
	
}//checkPwd() end

function checkNickname() {
	
    //유저가 입력한 값을 얻어옴
   var value = $nickname.val();
    
    //이전 글자와 현재 글자가 같지 않을때만
   if(oldNickname!=value) { 
	   //현재 글자를 이전글자로 업데이트
	   oldNickname = value;
   
	   if(nicknameReg.test(value)) {
		   
		 	//체크를 다시 시작하니까 무조건 false로
			isValidNickname = false;
		   
		   //ajax작동시작
		   $nicknameMsg.removeClass("ok")
		         .text("확인중...");
		   
		   //application/x-www-form-urlencoded
		   $.ajax({
			   url:"/ajax/user/nickname",
			   dataType:"json",
			   data:{"nickname":value},
			   error:function() {
				   
				  alert("서버 점검중!");
				  
			   },
			   success:function(json) {
				   
				   if(json.result) {
					   isValidNickname = true;
					   $nicknameMsg.addClass("ok").text("아주 좋은 별명입니다.");
				   }else {
					   isValidNickname = false;
					   $nicknameMsg.removeClass("ok").text("이미 사용중이거나 탈퇴한 별명입니다.");
				   }//if~else end
				   
			   }//success end
		   });//$.ajax() end
	        
	   }else {
	        $nicknameMsg.removeClass("ok").text("한글로 1~10글자로 입력해주세요.");
	   }//if~else end
   
   }//if end
	
}//checkNickname() end

//아이디 유효성검사용 함수
function checkId() {
	
    //유저가 입력한 값을 얻어옴
   var value = $id.val();
    
    //이전 글자와 현재 글자가 같지 않을때만
   if(oldId!=value) { 
	   //현재 글자를 이전글자로 업데이트
	   oldId = value;
   
	   if(idReg.test(value)) {
		   
		 	//체크를 다시 시작하니까 무조건 false로
			isValidId = false;
		   
		   //ajax작동시작
		   $idMsg.removeClass("ok")
		         .text("확인중...");
		   
		   $.ajax({
			   url:"/ajax/user/id",
			   dataType:"json",
			   data:{"id":value},
			   error:function() {
				   
				  alert("서버 점검중!");
				  
			   },
			   success:function(json) {
				   
				   if(json.result) {
					   isValidId = true;
					   $idMsg.addClass("ok").text("아주 좋은 아이디입니다.");
				   }else {
					   isValidId = false;
					   $idMsg.removeClass("ok").text("이미 사용중이거나 탈퇴한 아이디입니다.");
				   }//if~else end
				   
			   }//success end
		   });//$.ajax() end
	        
	   }else {
	        $idMsg.removeClass("ok").text("첫글자를 영어로, 영어,숫자 4~20글자로 입력해주세요.");
	   }//if~else end
   
   }//if end

}//checkId end

$id.keyup(checkId)
   .blur(checkId)
   .focus();//id에 포커스 지정
   
$nickname.keyup(checkNickname)
         .blur(checkNickname);
   
$pwd.keyup(checkPwd);
   
$confirm.keyup(checkConfirmPwd);  

   
//profile사진이 변경되면
$profile.change(checkProfile);//change() end

//form submit
$joinForm.submit(function() {

	checkNickname();
	checkPwd();
	checkProfile();
	
	
	if(!isValidId ||
	   !isValidPwd ||
	   !isConfirmPwd ||
	   !isValidNickname ||
	   $profileBox.hasClass("no_image")
	   ) {
		//console.log("서브밋 안됨");
		alert("작성하지 않은 항목이 있습니다.");
		return false;
	}//if end
	
	
});//submit() end

</script>