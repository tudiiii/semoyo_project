<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style >

	#timerMain input{
		text-align: center;
	}
</style>
<meta charset="UTF-8">
<title>세상 모든 요리레시피 - 세모요</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Stylish"
	rel="stylesheet">
<link rel="stylesheet" href="/css/recipe.css" />


</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>

	<!-- 사이드 타이머 -->
	<div id="timerBox">
		<div>
			<h3>
				타이머 <i class="fas fa-stopwatch"></i>
			</h3>
		</div>
		<form id="timerForm">
			<div class="timerUpDown timerUpBox">
				<button class="up up_down_btn hour_up" type="button">
					<i class="fas fa-caret-up"></i>
				</button>
				<button class="up up_down_btn min_up" type="button">
					<i class="fas fa-caret-up"></i>
				</button>
				<button class="up up_down_btn sec_up" type="button">
					<i class="fas fa-caret-up"></i>
				</button>
			</div>
			<div id="timerMain">

				<input id="timerHour" type="text" onfocusout=”removeChar(event)”
					onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'
					style='ime-mode: disabled;' placeholder="00"> <span>
					: </span> <input id="timerMin" type="text" onfocusout=”removeChar(event)”
					onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'
					style='ime-mode: disabled;' placeholder="00"> <span>:</span>
				<input id="timerSec" type="text" onfocusout=”removeChar(event)”
					onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'
					style='ime-mode: disabled;' placeholder="00">

			</div>
			<div class="timerUpDown">
				<button class="down up_down_btn hour_down" type="button">
					<i class="fas fa-caret-down"></i>
				</button>
				<button class="down up_down_btn min_down" type="button">
					<i class="fas fa-caret-down"></i>
				</button>
				<button class="down up_down_btn sec_down" type="button">
					<i class="fas fa-caret-down"></i>
				</button>
			</div>
			<div id="timerBtn">
				<button id="startTimer" class="timer_btn" form="timerForm"
					type="button">시작</button>
				<button id="stopTimer" class="timer_btn" type="button">정지</button>
				<button id="resetTimer" class="timer_btn" type="button">초기화</button>
			</div>

		</form>


		<div class="gram_box">
			<button type="button" class="gram_btn">계량법 안내</button>
		</div>
	</div>

	<!-- 전체를 감싸는  -->
	<div id="recipeBox">

		<ul id="category">
			<!-- 카테고리 -->
			<li>${recipe.kinds}</li>
			<li>${recipe.situation}</li>
			<li>${recipe.section}</li>
			<li>${recipe.ingredient}</li>
		</ul>


		<div id="firstBox">
			<!-- 이미지 부터 신고까지 감사는 박스-->

			<div id="imgBox">
				<button class="btn_left">
					<i class="fas fa-angle-left"></i>
				</button>
				<button class="btn_right">
					<i class="fas fa-angle-right"></i>
				</button>
				<div id="recipeImgBox">
					<ul id="recipeUl" style="width: 1800px">
						
							<c:if test="${recipe.pic!=null}">
								<li class="recipe_img"><img class="c_img"
									src="${recipe.pic}"></li>
							</c:if>
							<c:if test="${recipe.pic1!=null}">
								<li class="recipe_img"><img src="${recipe.pic1}"></li>
							</c:if>
							<c:if test="${recipe.pic2!=null}">
								<li class="recipe_img"><img src="${recipe.pic2}"></li>
							</c:if>
							<c:if test="${recipe.pic3!=null}">
								<li class="recipe_img"><img src="${recipe.pic3}"></li>
							</c:if>
							<c:if test="${recipe.pic4!=null}">
								<li class="recipe_img"><img src="${recipe.pic4}"></li>
							</c:if>
						

					</ul>
				</div>
				<!--//#recipeImgBox -->

				<div class="user_box">
					<a href="/user/mypage/${recipe.userNo }" class="profile"> <img src="${recipe.profile}"
						class="face_img">
					</a> <span class="user_name">${recipe.nickname}</span>
				</div>

			</div>
			<!--//#imgBox end -->

			<h2 class="recipe_title">${recipe.title}</h2>
			<div class="text_info">${recipe.contents}</div>


			<ul id="iconBox">
				<li><i class="fas fa-user"></i>
				<div class="icon_txt">${recipe.person}인분</div></li>
				<li><i class="far fa-clock"></i>
				<div class="icon_txt">${recipe.time}분이내</div></li>
				<li><i class="fas fa-thermometer-empty"></i>
				<div class="icon_txt">${recipe.step}</div></li>

			</ul>
			<ul id="infoBox">
				<li><button class="recipe_scrap_btn"><i class="far fa-bookmark"></i></button>
				<div class="icon_txt sc_txt"></div></li>

				<li>
					<button class="btn_like <c:if test="${flag}">like</c:if>">
						<i class="fas fa-heart"></i> <i class="far fa-heart"></i>
					</button>
					<div class="like_txt icon_txt">${count }</div>
				</li>

				<li><i class="fas fa-eye"></i>
					<div class="view_num icon_txt">${recipe.read}</div></li>
			</ul>

			<div class="black_box">
				<button class="black_btn" type="button">
					<i class="fas fa-exclamation-triangle"></i>
				</button>
			</div>
		</div>
		<!--//#firstBox end-->

		<div id="foodstuffBox">
			<h4>준비물</h4>
			<span class="fs_text">★은 필수 </span>
			<button class="gram_info">계량법 안내</button>
			<strong class="strong">[재료]</strong>
			<ul class="foodstuff_ul">
				<c:forEach items="${useIngredients}" var="useIng">
					<c:choose>
						<c:when test="${useIng.checked == 1}">
							<li><i class="fas fa-star fs_on"></i> ${useIng.name}<span>${useIng.gram}${useIng.unit}</span></li>
						</c:when>
						<c:otherwise>
							<li>${useIng.name}<span>${useIng.gram}${useIng.unit}</span></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>

			<strong class="strong">[도구]</strong>
			<ul class="foodstuff_ul">
				<c:forEach items="${useTools}" var="useTool">
					<c:choose>
						<c:when test="${useTool.checked ==1 }">
							<li><i class="fas fa-star fs_on"></i> ${useTool.name}</li>
						</c:when>
						<c:otherwise>
							<li>${useTool.name}</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>


			</ul>
		</div>
		<!--//#foodstuffBox end-->
		<c:if test="${recipe.video != null}">
		<div class="box_video">
			<h4>동영상</h4>
			<div class="recipe_video">
				<iframe width="600" height="400" src="${recipe.video}"
					frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>
		</div>
		</c:if>

		<div class="box_order">
			<h4>조리 순서</h4>
			<ul>


				<c:forEach items="${order}" var="orderCook" varStatus="status">

					<li class="step1 bundle">
						<div class="step_num">${status.count}Go</div>

						<div class="step_text">${orderCook.contents}</div>
						<div class="step_img">
							<c:choose>
								<c:when test="${orderCook.image==null }">
							<img src="/img/triangle.png" />
								</c:when>
								<c:otherwise>
							<img src="${orderCook.image}" />
								</c:otherwise>
							</c:choose>
						</div>

						<ul class="step_tip_box">
							<c:choose>
								<c:when test="${orderCook.ingredients==null }">

								</c:when>
								<c:otherwise>
									<li class="step_tip"><i class="fas fa-carrot"></i><span>${orderCook.ingredients}</span></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${orderCook.fire==null }">
								</c:when>
								<c:otherwise>
									<li class="step_tip"><i class="fas fa-fire-alt"></i><span>${orderCook.fire}</span></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${orderCook.tools==null }">
								</c:when>
								<c:otherwise>
									<li class="step_tip"><i class="fas fa-dumpster"></i><span>${orderCook.tools}</span></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${orderCook.times==null }">
								</c:when>
								<c:otherwise>
									<li class="step_tip"><i class="fas fa-stopwatch"></i><span>${orderCook.times}</span></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${orderCook.tips==null }">
								</c:when>
								<c:otherwise>
									<li class="step_tip"><i class="fas fa-pencil-alt"></i><span>${orderCook.tips}</span></li>
								</c:otherwise>
							</c:choose>
						</ul> <!-- 유저들 팁 쓰는 공간 만들기 -->
						<div class="tip_cmt_wrap">
							<div class="tip_cmt_box">
								<!-- 팁 댓글창 -->
								<form class="order_comment">
									<input type="hidden" class="orNo" name="orNo"
										value="${orderCook.no}" /> <input type="text" class="reple"
										name="reple" placeholder="알고 있는 다른 팁을 공유해주세요" />
									<button>등록</button>
								</form>
							</div>
							<!--//.tip_comment_box-->


							<ul class="cmt_li_box tip_add${orderCook.no}">

							</ul>
							<div class="tip_add_box">
								<button class="step_tip_plus${orderCook.no} step_plus_btn"
									type="button" data-pageno="1">더 보기</button>
							</div>
						</div> <!--//.conment_wrap-->
					</li>
				</c:forEach>

			</ul>

			<div id="tipBox">
				<h4>마무리 한마디</h4>
				<strong>${recipe.tip}</strong>
			</div>

			<div id="tagBox">
				<h4>태그</h4>
				<c:forEach items="${tags}" var="tag">

					<a class="recipe_tag" href="/recipe?search=${tag.name}">${tag.name}</a>
				</c:forEach>

			</div>

		</div>
		<!--//.box_order-->

		<div id="commentBox">
			<h4>댓글</h4>

			<div class="cmt_write_box">


				<form class="recipe_comment">
					<div id="rcpCmtWrap">
						<input type="hidden" class="recipeNo" name="recipeNo"
							value="${recipe.no}" />
						<div id="reviewImgBox" class="no_image">
							<img src="/img/triangle.png" width="100" height="100" id="reviewImg" />
							<label class="add_label"><i class="fas fa-plus"></i><input
								id="addImg" class="comPic" name="comPic" type="file"
								accept="image/*"></label>
							<textarea class="recipeCom" name="recipeCom"
								placeholder="댓글을 입력해주세요"></textarea>
							<button id="cmtBtn">등록</button>
						</div>
				</form>
			</div>
			<ul class="rcp_ul">



			</ul>
			<div class="add_cmt_box">
				<button class="add_cmt_btn" type="button" data-rpageno="1">더
					보기</button>
			</div>
		</div>


	</div>
	<!--//#recipeWrap end-->

	</div>
	<%-- <div id="otherRcpBox">
		<h4>'메뉴'의 다른 레시피</h4>

	</div> --%>

	<!-- 계량법 안내 div -->
	<div class="gram_background"></div>

	<div id="gramText">
		<div id="gramTitle">계량법 안내</div>
		<div id="gramExit">
			<button id="gramBtn2">
				<i class="fas fa-times"></i>
			</button>
		</div>
		<img src="/img/gram.jpg">
		<button id="gramBtn1">닫기</button>
	</div>
	<c:import url="/WEB-INF/template/footer.jsp" />

	<script type="text/template" id="tipCmtTmp">

<@_.each(tipCmt, function(ordercmt) {@>
        <li class="cmt_li" data-no="<@=ordercmt.orNo@>"><@=ordercmt.content@><span class="tip_username"><@=ordercmt.nickname@></span><span
                class="regdate"><@=ordercmt.printTime@></span></li>
			<@})@>

</script>
	<script type="text/template" id="rcpCmtTmp">
<@_.each(rcpCmt, function(reply) {@>
    <li class="rcp_cmt_li">
        <div class="cmt_user_box">
        <a href="/user/mypage/<@=reply.userNo@>" class="cmt_profile">
        <img src="<@=reply.profile@>" class="cmt_face_img">
        </a>
        </div>
        <div class="cmt_info_box">
        <span class="cmt_user_name"><@=reply.nickname@></span>
        <span class="cmt_date"><@=reply.printTime@></span>
<form action="/recipe/review/delete" method="post" class="delete_form">
	<input type="hidden" name="_method" value="DELETE"/>
<input type="hidden" name="no" value="<@=reply.no@>" />
						
    <button class="delete_btn">삭제</button>
        </div>
		</form>
        <div class="rcp_cmt_text">
        <span>
            <@=reply.contents@>
    </span></div>
    <div class="rcp_cmt_img"><img src="<@=reply.pic@>"/></div>
        </li>

<@})@>
</script>

	<script src="/js/jquery.js"></script>
	<script src="/js/fix-footer.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script src="/js/header.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
		integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
		crossorigin="anonymous"></script>

	<script>
		// 타이머 버튼 누를시 숫자 업
		var $hourUp = $(".hour_up");
		var $hourDown = $(".hour_down");
		var $minUp = $(".min_up");
		var $minDown = $(".min_down");
		var $secUp = $(".sec_up");
		var $secDown = $(".sec_down");
		
		var $startTimer = $("#startTimer");

		var num = 1;
		// 시
		$hourUp.click(function() {
			var num1 = $timerHour.val();
			num1 = num1 - 0 + 1;
			if (num1 > 99) { //num1이 99보다 크면 리턴 안올라감
				return;
			}
			$timerHour.val(num1);
		})

		$hourDown.click(function() {
			var num1 = $timerHour.val();
			num1 = num1 - 1;
			if (num1 < 0) { // num1이 0보다 작으면 안내려감
				return;
			}
			$timerHour.val(num1);
		})
		//분
		$minUp.click(function() {
			var num1 = $timerMin.val();
			num1 = num1 - 0 + 1;
			if (num1 > 59) { //num1이 59보다 크면 리턴 안올라감
				return;
			}
			$timerMin.val(num1);
		})

		$minDown.click(function() {
			var num1 = $timerMin.val();
			num1 = num1 - 1;
			if (num1 < 0) { // num1이 0보다 작으면 안내려감
				return;
			}
			$timerMin.val(num1);
		})
		// 초
		$secUp.click(function() {
			var num1 = $timerSec.val();
			num1 = num1 - 0 + 1;
			if (num1 > 59) { //num1이 59보다 크면 리턴 안올라감
				return;
			}
			$timerSec.val(num1);
		})

		$secDown.click(function() {
			var num1 = $timerSec.val();
			num1 = num1 - 1;
			if (num1 < 0) { // num1이 0보다 작으면 안내려감
				return;
			}
			$timerSec.val(num1);
		})
		
		

		///////////////////////////////////도와줘 타이머
		
		var $timerHour = $("#timerHour");
		var $timerMin = $("#timerMin");
		var $timerSec = $("#timerSec");		
		
		var time = 0;
		
		
		
		$('#startTimer').click(function(){
			$(this).attr("disabled", true);
			time = ($timerSec.val()-0) + ($timerMin.val()*60) + ($timerHour.val()*3600);
			timmer = setInterval(ttime, 1000);			
			
		});
		$('#stopTimer').click(function(){
			clearInterval(timmer);
			$('#startTimer').removeAttr("disabled");
		});
		$('#resetTimer').click(function(){
			clearInterval(timmer);
			$timerSec.val(0);
			$timerMin.val(0);
			$timerHour.val(0);
			$('#startTimer').removeAttr("disabled");
		});
		function ttime(){
			if(time == 0){
				clearInterval(timmer);
				$('#startTimer').removeAttr("disabled");
				alert("타입아웃!");
			}else{
				time -=1;
				$timerSec.val(time%60);
				if(time>3600){
					$timerMin.val(Math.floor(time/60)%60);
					$timerHour.val(Math.floor(time/3600));		
				}else if(time>60){
					$timerMin.val(Math.floor(time/60));
					$timerHour.val(0);
				}else{
					$timerMin.val(0);
					$timerHour.val(0);
				}
			}
		}
		

		/////////////////////////////////타이머에 숫자만 입력 받기
		function onlyNumber(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
				return;
			else
				return false;
		}
		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
				return;
			else
				event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}

		///////////////////////////////////////////사진
		//추가한 사진 갯수. 최대 5장.
		var imgNum = 0;
		//추가한 이미지명
		var imgName = "";

		function readURL() {

			var reader = new FileReader();
			reader.onload = function(e) {
				// imgName = input.files[0].name;
				imgName = $(".talk_pic").find('img').each(function() {
					$(this).attr('src');
				});
				imgNum++;
				var img_html = "<div class='talk_pic'>"
						+ "<img class='cmt_pic' src='"/ + e.target.result + "'/>"
						+ "<button type='button' class='delete_button'><i class='fas fa-times'></i></button></div>";
				"<input type='hidden' name='pics' value='" + imgName + "'/>";

				$('#rcpCmtWrap').append(img_html);

			}
			// reader.readAsDataURL(input.files[0]);
		}

		//사진 추가시
		$("#addImg").change(function() {
			readURL(this);
		});

		//사진 삭제
		$("body").on("click", ".delete_button", function() {

			$(this).parent().remove();
			imgNum--;

		});

		/////////////////////////////////////////팁 댓글
		var tipCmtTmp = _.template($("#tipCmtTmp").html());
		var num = 2;
	


		//////////////////////////////////////계량법안내
		var $gramShow1 = $(".gram_btn");
		var $gramShow2 = $(".gram_info");
		var $gramExit1 = $("#gramBtn1");
		var $gramExit2 = $("#gramBtn2");
		var $gramBackground = $(".gram_background");
		var $gram = $("#gramText");

		$gramShow1.click(function() {
			$("html").css({
				"overflow-y" : "hidden",
				"padding-right" : "17px"
			});
			$gramBackground.show();
			$gram.show();

		});//$gramShow1, $gramShow2 click() end

		$gramShow2.click(function() {
			$("html").css({
				"overflow-y" : "hidden",
				"padding-right" : "17px"
			});
			$gramBackground.show();
			$gram.show();

		});//$gramShow1 click() end

		$gramExit1.click(function() {
			$("html").css({
				"overflow-y" : "visible",
				"padding-right" : "0px"
			});
			$gramBackground.hide();
			$gram.hide();
		}); //$gramExit1 click() end

		$gramExit2.click(function() {
			$("html").css({
				"overflow-y" : "visible",
				"padding-right" : "0px"
			});
			$gramBackground.hide();
			$gram.hide();
		});//$gramExit2 click() end

		$gramBackground.click(function() {
			$("html").css({
				"overflow-y" : "visible",
				"padding-right" : "0px"
			});
			$gramBackground.hide();
			$gram.hide();

		}); //$gramBackground click() end

		///////////////////////////////////////이미지 넘기기

		var $recipeUl = $("#recipeUl");
		var idx = 0;

		$("#imgBox .btn_right").click(function() {
			idx++;
			if (idx == 3) {
				idx = 2;
			}

			left = -(idx * 600);
			$recipeUl.css("left", left);
		});

		$("#imgBox .btn_left").click(function() {
			idx--;
			if (idx == -1) {
				idx = 0;
			}

			left = -(idx * 600);
			$recipeUl.css("left", left);
		});
		
		
		
		//2019년 1월 4일 김현 ordercomment 추가
		$(".order_comment").submit(function( ){
			
			//alert("tsfsdfsdf");
			
			var $this = $(this);
			
			var orderNo = $this.find(".orNo").val();//댓글 등록 할 step의 아이디

			
			var contents =  $this.find(".reple").val();//댓글 내용
			
			
		
			
			
			$.ajax({
				url:"/order/comment/",
				type:"POST",
				dataType:"json",
				data:{
					orNo:orderNo,
					content:contents
				},
				error:function() {
					alert("로그인을 해주세요!");
				},
				success:function(json) {
					console.log(json);
					
					if(json.result) {
						//$(".tip_add"+orNo).preAppend(tipCmtTmp({"tipCmt":json}));
						
						getOrderCmtList(orderNo,1,"N");
					}
				}
			});
			
			return false;
		});
		
		<c:forEach items="${order}" var="orderCook" varStatus="status">
			getOrderCmtList(${orderCook.no},1,"A");
		</c:forEach>
		 
			
		<c:forEach items="${order}" var="orderCook" varStatus="status">
		
		//////////////////////팁댓글 더보기 버튼 클릭시 0106 김현
		$(".step_tip_plus${orderCook.no}").click(function() {
			
			var pageNo = $(this).attr("data-pageno");
			pageNo = parseInt(pageNo)+1;
			$(this).attr("data-pageno",pageNo);
			
			getOrderCmtList(${orderCook.no},pageNo,"A");	
		})
		</c:forEach>
		function getOrderCmtList(orNo,pageNo,status) {
		
		/* var $this = $(this); */
			
			$.ajax({
				url:"/order/comment/"+ orNo+"/page/"+pageNo,
				type:"GET",
				dataType:"json",
				success:function(json) {
					console.log(json);
					if(status=="N"){
						$(".tip_add"+orNo).html(tipCmtTmp({"tipCmt":json}));
					}else{
						$(".tip_add"+orNo).append(tipCmtTmp({"tipCmt":json}));
					}
					
					$(".reple").val("");
					
					
				},error:function() {
					console.log("로그인을 해주세요!");
				}
				
			});
			
		}
		
		
		
		var rcpCmtTmp  = _.template($("#rcpCmtTmp").html());
		
		
		//2019년 1월 4일 김현 recipe_comment 추가 레시피댓글
		$(".recipe_comment").submit(function( ){
			
			//alert("tsfsdfsdf");
			
			var $this = $(this);
			
			var recipeNo = $this.find(".recipeNo").val();
			var contents =  $this.find(".recipeCom").val();
			var pic =  $this.find("#reviewImg").attr("src");
			
			
			
			
			$.ajax({
				url:"/recipe/review/",
				type:"POST",
				dataType:"json",
				data:{
					typeNo:recipeNo,
					contents:contents,
					pic:pic
				},
				error:function() {
					alert("로그인을 해주세요!");
				},
				success:function(json) {
					console.log(json);
					
					if(json.result) {
						getRecipeCmtList(recipeNo,1,"N");
						$("#reviewImg").attr("src","");
						$reviewImg.css("z-index",0);
						$reviewImgBox.addClass("no_image");

					}
				}
			});
			
			return false;
		});
		
		///////////더보기 처리 01-06 김현
	
	
	
	
	// 레시피 댓글 더보기 버튼 클릭시 0107 김현
	
	var rcpNo = $(".recipeNo").val();
	getRecipeCmtList(rcpNo,1,"A");
	
	$(".add_cmt_btn").click(function() {
		
		var rPageNo = $(this).attr("data-rpageno");
		rPageNo = parseInt(rPageNo)+1;
		$(this).attr("data-rpageno",rPageNo);
	
		
		getRecipeCmtList(rcpNo,rPageNo,"A");	
	})
		////////////////////////////////////////
	//getRecipeCmtList();	
	
		function getRecipeCmtList(rcpNo,rPageNo,status) {
		
		//var $this = $(this);
		
			$.ajax({
				url:"/recipe/review/"+ rcpNo+"/page/"+rPageNo,
				type:"GET",
				dataType:"json",
				success:function(json) {
					console.log(json);
					if(status=="N"){
					$(".rcp_ul").html(rcpCmtTmp({"rcpCmt":json}));
						
					}else{
						$(".rcp_ul").append(rcpCmtTmp({"rcpCmt":json}));
					}
					

					//비우기
					$(".recipeCom").val("");
					$(".comPic").val("");
				},error:function() {
					alert("댓글 내용을 입력해주세요 !");
				}
				
			});
			
		}
		
		
		///////////////////////////////////레시피 댓글 이미지 리사이즈 
		
		//image인지 확인하는 정규표현식
		var profileReg = /^image/;
		
//profile input요소(type file)
var $profile = $("#addImg");
//profile msg 
// var $profileMsg = $(".msg.profile");
//profileName
// var $profileName = $("#profileName");
//profileImg
var $reviewImg = $("#reviewImg");
//profileBox
var $reviewImgBox = $("#reviewImgBox");

//유저가 이전에 입력한 값(ajax경우 중복 요청을 막기 위해서)
var oldProfile = null;
		
function checkProfile() {
	
	
	//alert("test");
	
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
	
	/* if(file==null||file.size<=0) {
		
		$profileMsg.removeClass("ok")
		           .text("제대로 된 파일을 선택해주세요.");
		
		return;
	}//if end */
	
	//이미지인지 확인!!
	/* if(!profileReg.test(file.type)) {
		
		$profileMsg.removeClass("ok")
        .text("이미지 파일을 선택해주세요.");
		
		return;
	}else {
		
		$profileMsg.text("");
		
	}//if~else end */
	
	if(oldProfile!=file.name) {
		
	oldProfile = file.name;
	
	//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
	//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
	
	//ajax로 넘길 폼을 생성하고
	var form = new FormData();
	
	//우리가 선택한 파일을 붙임
	// form.append("type","P");//일반적인 데이터
	
	//1)파라미터명, 2) 파일 3) 파일명
	form.append("uploadImg",file,file.name);
	
	//multipart/form-data로 ajax처리
	$.ajax({
		url:"/ajax/img",
		dataType:"json",
		type:"POST",//multipart/form-data
		processData:false,//multipart/form-data
		contentType:false,//multipart/form-data
		data:form,
		error:function() {
			alert("사진 서버 점검중!");
		},
		success:function(json) {
			
			console.log(json.src);
			
			$reviewImg.attr("src",json.src);
			
			// $profileName.val(json.src);
			$reviewImg.css("z-index",1);
			$reviewImgBox.removeClass("no_image");
			
		}//success end
		
	});//ajax() end
	
	}//if end
	
}//checkProfile() end
		
$profile.change(checkProfile);//change() end
		
		
		///////////////////좋아요
		
		$(".btn_like").click(function() {
		
<c:choose>
<c:when test="${loginUser==null }">
	alert("로그인 해주세요!");
</c:when>
<c:otherwise>

	$.ajax({
		url:"/ajax/like",
		dataType:"json",
		type:"POST",
		data:{typeNo:${recipe.no}},
		error:function() {
			alert("서버 점검중!");
		},
		success:function(json) {
			console.log(json.flag);
			
			if(json.flag) {
				$(".btn_like").addClass("like");
			}else {
				$(".btn_like").removeClass("like");
			}//if else end
			
			$(".like_txt").text(json.count);
			
		}
	})
</c:otherwise>
</c:choose>
});
		
		//레시피 스크랩 김현 
		
		
		
		$(".recipe_scrap_btn").on("click", function () {
    		
			if(${loginUser == null}) {
				alert("로그인 해주세요!");
			} else {
	    		
	    		if(${loginUser == null}) {
	    			alert("로그인 해주세요!");
	    		} else {
	    			// alert(talknum);
	            	$.ajax({
	            		url: "/ajax/recipe/scrap",
	            		dataType: "json",
	            		type:"POST",
	            		data: {"typeNo": ${recipe.no}},
	            		error: function() {
	        				alert("서버 점검 중");
	        			},
	            		success: function(json) {
	            			
	            			if($(".recipe_scrap_btn i").hasClass('far')) {
	            				$(".recipe_scrap_btn i").removeClass('far').addClass('fas');
	            			}else{
	            				$(".recipe_scrap_btn i").removeClass('fas').addClass('far');
	            				
	            			}
	            			
	            			$(".sc_txt").text(json.scrapCnt);
	        			}
	            	});
	    		}//if else end
	    		
			}//if else end
	        	
	   });
		
		/////////////////////// 현 필수 추가함.
		
	$('#goBtn').click(function(e){
    	var text = "";
    	var nums = "";
       $('.no_checked.on').each(function(){
    	   text = text+$(this).next().next().next().next().val() + ","
    	   nums = nums + $(this).next().next().next().next().next().val() + ",";
       });
       	nums = nums.substring(0, nums.length-1);
       	text = text.substring(0, text.length-1);
       	location.href="/recipe?text="+text+"&nums="+nums;
    });
		
		
	</script>

</body>
</html>