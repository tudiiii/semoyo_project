<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>세상의 모든 요리</title>
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/giveDetail.css"/>

</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>

<div class="contents">
    <div id="photo_title_box">
        <div class="photo_left_box">
            <button class="photo_left_btn"><i class="fas fa-angle-left"></i></button>
            <div>
	            <div class="move_img_box">
	            <c:forEach items="${pics }" var="pic">
	            	<c:if test="${pic!=null }">
	            		<img src="${pic }">
	            	</c:if>
	            </c:forEach>
	            </div>
            </div>
            <button class="photo_right_btn"><i class="fas fa-angle-right"></i></button>
        </div>
        <div class="title_right_box">
            <h2>${gives.title}</h2>
            <div class="text_box">${gives.contents}</div>
            <form action="/give/${gives.no }/review" method="post">
	            <div class="write_box">
	            <input type="hidden" name="contents" value="" id="contentsId">
	            <c:choose>
	            	<c:when test="${masterUser!=null }">
	            			<c:forEach items="${masterUser }" var="mm" >
	            				<c:choose>
	            					<c:when test="${loginUser==null }">
	            						<textarea placeholder=" 종료된 나눔입니다 !! 로그인 하여 당첨을 확인하세요!" disabled="disabled"></textarea>
	            						<div><button type="button" class="noneBtn" type="button">로그인 하세요!</button></div>
	            					</c:when>
	            					<c:when test="${loginUser!=null&&mm.getUserNo()==loginUser.no&&mm.userCheck==0 }">
	            						<textarea placeholder="당첨을 축하드립니다.!!!" disabled="disabled"></textarea>
	            						<div><button type="button" data-no="${mm.no }" data-giveNo="${mm.giveNo }" class="writhReviewBtn" type="button">후기 작성하러가기!</button></div>			
	            					</c:when>
	            					<c:when test="${loginUser!=null&&mm.getUserNo()==loginUser.no&&mm.userCheck==1 }">
	            						<textarea placeholder="당첨을 축하드립니다.!!!" disabled="disabled"></textarea>
	            						<div><button type="button" class="noneBtn" type="button">이미 후기를 작성하였습니다.</button></div>			
	            					</c:when>
	            					<c:otherwise>
	            						<textarea placeholder="아쉽지만 당첨되지 않았어요 다음을 노려보세요!" disabled="disabled"></textarea>
	            						<div><button type="button" class="noneBtn" type="button">종료된 나눔입니다.</button></div>
	            					</c:otherwise>
	            				</c:choose>
	            			</c:forEach>
	            	</c:when>
	            	<c:when test="${endFlag}">
	            		<textarea placeholder="종료된 나눔입니다. 좋아요로 당첨자를 뽑아주세요" disabled="disabled"></textarea>
	            		<div><button type="button" class="noneBtn" type="button">종료된 나눔입니다.</button></div>
	            	</c:when>
	            	<c:when test="${loginUser==null }">
	            		<textarea placeholder="로그인 하세요~" disabled="disabled"></textarea>
	            		<div><button type="button" class="noneBtn" type="button">신청하기</button></div>
	            	</c:when>
	            	<c:when test="${flag==1}">
	            		<textarea placeholder="이미 작성하셨습니다." disabled="disabled"></textarea>
	            		<div><button type="button" class="noneBtn" type="button">이미 신청하셨습니다.</button></div>
	            	</c:when>
	            	<c:otherwise>
	            		<textarea placeholder="신청란입니다! 글을 재밌게 적어 추천을 받아보세요"></textarea>
	            		<div><button class="regeWritheBtn">신청하기</button></div>
	            	</c:otherwise>
	            </c:choose>
	            </div>
            </form>
        </div>
    </div><!--// #photo_title_box end-->
    <div id="user_time_box">
        <div class="face_box"><img src="${gives.profile}"></div>
        <div class="name_box">${gives.nickname }</div>
        <div class="time_box">
            <div class="finish_box">마감시간 <span>${gives.endTime}</span></div>
            <div class="pick_box">당첨발표시간 <span>${gives.partyDate }</span></div>
        </div>
    </div>
    <div id="choice_write_box">
        <div>당첨자는 단, ${gives.personnel}명 !!</div>
    </div>
    <div id="review_bottom_box">
        <div class="review_count_box">신청자 수 <span>${gives.countNo }</span></div>
        <div class="review_hit_box">
            <c:forEach items="${reviewBest }" var="item">
            <div class="give_review">
                <div class="review_hit">HIT 좋아요 폭주</div>
                <div class="give_review_profile">
                    <img src="${item.profile }"/><div>${item.nickname }</div>
                </div>
                <div class="give_review_text">${item.contents }</div>
                <div data-num="${item.no }" class="give_review_right give_review_like">
					<c:choose>
						<c:when test="${item.likeFlag}">
							<i class="fas fa-heart"></i>
						</c:when>
						<c:otherwise>
							<i class="far fa-heart"></i>
						</c:otherwise>
					</c:choose>
                <span>${item.cnt }</span></div>
                <div class="give_review_right give_review_date">${item.regdate }</div>
            </div><!--// .give_review end-->
            </c:forEach>
        </div><!--// .review_hit_box end-->


        <div class="review_box">
        <c:forEach items="${review }" var="review">
            <div class="give_review">
                <div class="give_review_profile">
                    <img src="${reveiw.profile }"/><div>${review.nickname }</div>
                </div>
                <div class="give_review_text">${review.contents }</div>
                <input type="hidden" value="${review.no }" class="reviewNo">
                <div data-num="${review.no }" class="give_review_right give_review_like"><i class="far fa-heart"></i><span>${reveiw.cnt }</span></div>
                <div class="give_review_right give_review_date">${review.regdate }</div>
            </div><!--// .give_review end-->
        </c:forEach>
        </div><!--// .review_box end-->
        <div id="review_more_box">
            <button id="review_more_btn" type="button">더 보기</button>
        </div><!--#review_more_box end-->
    </div><!--// #review_bottom_box end-->
</div><!--#contents end-->


<script type="text/template" id="reviewTmp">
	<@_.each(data, function(dd){@>
    <div class="give_review">
   	 <div class="give_review_profile">
   	     <img src="<@=dd.profile@>"/><div><@=dd.nickname@></div>
   	 </div>
   	 <div class="give_review_text"><@=dd.contents@></div>
	 <input type="hidden" value="<@=dd.no@>" class="reviewNo">
   	 <div data-num="<@=dd.no@>" class="give_review_right give_review_like like"><i class="<@if(!dd.likeFlag){@>far<@}else{@>fas<@}@> fa-heart hi"></i><span><@=dd.cnt@></span></div>
   	 <div class="give_review_right give_review_date"><@=dd.printTime@></div>
	</div>
	<@})@>
</script>


<c:import url="/WEB-INF/template/footer.jsp"/>
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/fix-footer.js"></script>
<script src="/js/header.js"></script>
<script>
    
    $('.header_box>.give').addClass('on');
    
    var giveReviewTmp = _.template($('#reviewTmp').html());
    
 	// 나중에 num 변수 삭제하고 json 파일로 받아와서 템플릿에서 each문 돌기기
    var givePage = 1;
    var giveSearch = '';
    function giveBoxPrint(){
    	$.ajax({
    		url:"/ajax/give/review",
    		dataType:"json",
    		data:{'pageNo':givePage++, 'no':${gives.no}},
    		error:function(){
    			alert("서버 펑펑!");
    		},
    		success:function(json){
    			$('.review_box').append(giveReviewTmp({"data":json.review}));
    			fixFooter();
    		}
    	});
    }
    giveBoxPrint();
    
    
    $('#review_more_box>button').click(giveBoxPrint);
    
    if(${picNum}==1){
    	$('.photo_left_box>button').css("display","none");
    }

    var img_left = 0;
    var img_num = 400*(${picNum}-1);
    $('.photo_left_box>button').click(function(){
        if($(this).hasClass('photo_left_btn')){
        	img_left=img_left+400;
            if(img_left>0){
                img_left=img_left-400;
            }
        }else{
        	img_left=img_left-400;
            if(img_left<-img_num){
                img_left=img_left+400;
            }
        }

        $('.move_img_box').css("left",img_left);
    });
    
    $('.writhReviewBtn').click(function(){
    	var aaa=$(this).data('no')-0;
    	var bbb=$(this).data('giveno')-0;
    	location.href="/review/register/"+aaa+"/"+bbb;
    	
    });

    //숫자 포맷
    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    
    
    $('.title_right_box .write_box button').click(function () {
    	
        var reviewText = $('.title_right_box .write_box textarea').val();
        reviewText = reviewText.replace(/(?:\r\n|\r|\n)/g, '<br/>');
        if(reviewText.length<1){
            return ;
        }
        var text = $('.write_box textarea').val();
        $('.write_box #contentsId').val(text);
        var count = $('.review_count_box span').text();
        $('.review_count_box span').text(count-0+1);
        
       
    });

    <%--$('#review_bottom_box').on('click', '.give_review_like', function () {
        if($(this).children('i').hasClass('far')){
            $(this).children('i').removeClass('far').addClass('fas');
            var cc = $(this).children('span').text();
            $(this).children('span').text(cc-0+1);
        }else{
            $(this).children('i').removbeClass('fas').addClass('far');
            var cc = $(this).children('span').text();
            $(this).children('span').text(cc-1);
        }

    });
    --%>
    
   
    
    $('#review_bottom_box').on('click', '.give_review_like', function () {
		var $main = $(this);
    	<c:choose>
    	<c:when test="${loginUser==null }">
    		alert("로그인 해주세요!");
    	</c:when>
    	<c:otherwise>

    		$.ajax({
    			url:"/ajax/like/give",
    			dataType:"json",
    			type:"POST",
    			data:{typeNo:$(this).data('num'), userNo:${loginUser.no}},
    			error:function() {
    				alert("서버 점검중!");
    			},
    			success:function(json) {
    				console.log(json);
    				if(json.flag) {
    					$main.find('i').removeClass('far').addClass('fas');
    				}else {
    					$main.find('i').removeClass('fas').addClass('far');
    				}//if else end
    				
    				$main.children('span').text(json.count);
    				
    			}
    		});
    	</c:otherwise>
    	</c:choose>
    	});
    
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
