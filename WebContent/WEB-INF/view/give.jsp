<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>세상의 모든요리</title>
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/give.css"/>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"/>
    <div class="contents">
        <div id="give_top_box"><img src="img/deadline.png" width="40px"/>
            마감 임박 <span>${giveCount }</span> 개
        </div>
        <div id="give_tab_box">
            <ul>
                <li class="give_tab on" data-type="tab1">나눔 <img src="/img/give-love.png" width="40px" height="40px"/></li>
                <li class="give_tab" data-type="tab2">나눔 후기 <img src="/img/customer-reviews.png" width="40px" height="40px"/></li>
            </ul>
        </div>
        <div id="give_content_box">
            <div class="give_contents on tab1">
                <div class="search_box">
                    <input class="give" placeholder="제목으로 검색">
                    <i class="fas fa-search give"></i>
                    <button type="button" class="give_add_btn">등록하기</button>
                </div><!--.search_box end-->
                <div id="give_box_boss">
                	<c:forEach items="${giveBox }" var="give">
                    <div class="give_box" data-num="${give.no }">
                    	<c:choose>
                    		<c:when test="${give.endStatus==null }">
                    		<div class="give_status"><img src="/img/tag-end.png" width="80px"/><span>종 료</span></div>
                    		</c:when>
                    		<c:otherwise>
                    		<div class="give_status"><img src="/img/tag-ing.png" width="80px"/><span>진 행</span></div>
                    		</c:otherwise>
                    	</c:choose>                        
                        <div class="give_left_box">
                            <div class="give_time"><span>${give.printTime }</span></div>
                            <div class="give_title">${give.title }</div>
                            <div class="give_text"><span>${give.contents }</span></div>
                            <div class="give_last">신청자 수 ${give.cnt } · ${give.nickname }</div>
                        </div><!--.give_left_box end-->
                        <div class="give_right_box"><img src="${give.pic1 }"></div>
                    </div><!--.give_box end-->
                    </c:forEach>
                </div><!--#give_box_boss end-->
                <div id="give_more_box">
                    <button id="give_more_btn" type="button">더 보기</button>
                </div><!--#give_more_box end-->
            </div><!--.give_contents end-->

            <div class="give_contents tab2">
                <div class="search_box" >
                    <input placeholder="제목으로 검색">
                    <i class="fas fa-search"></i>
                </div>
                <div id="review_box_boss">
                <c:forEach items="${giveReview }" var="item">
                
                    <div class="review_box" data-num="${item.no }">
                        <div class="review_left_box">
                            <div class="review_title">${item.title }</div>
                            <div class="review_text"><span>${item.content }</span></div>
                            <div class="review_last">${item.printTime } · ${item.nickname }</div>
                        </div><!--.review_left_box end-->
                        <div class="review_right_box"><img src="${item.pic1 }"></div>
                    </div><!--.review_box end-->
                 </c:forEach>
                </div><!--#review_box_boss end-->
                <div id="review_more_box">
                    <button id="review_more_btn" type="button">더 보기</button>
                </div><!--#review_more_box end-->
            </div>
        </div>
    </div>

    <div id="reviewPopup"></div>
    <div id="centerPopup">
       
    </div>
<script type="text/template" id="giveReviewTmp">

 <div class="popup_top"><i class="fas fa-times"></i></div>
        <div class="popup_center">
            <div class="popup_center_left">
<button class="popup_left_btn"><i class="fas fa-angle-left"></i></button>
<div><div class="move_img_box">
<@if(giveRe.pic1!=null){@>
<img src="<@=giveRe.pic1@>">
<@}@>
<@if(giveRe.pic2!=null){@>
<img src="<@=giveRe.pic2@>">
<@}@>
<@if(giveRe.pic3!=null){@>
<img src="<@=giveRe.pic3@>">
<@}@>
<@if(giveRe.pic4!=null){@>
<img src="<@=giveRe.pic4@>">
<@}@>
<@if(giveRe.pic5!=null){@>
<img src="<@=giveRe.pic5@>">
<@}@>

</div></div>
<button class="popup_right_btn"><i class="fas fa-angle-right"></i></button></div>
            <div class="popup_center_right">
                <h3><@=giveRe.title@></h3>
                <div class="right_title">
<img src="/img/give-love.png" width="25px" height="25px"/>
<a href="/give/<@=giveRe.giveNo@>"><@=giveRe.giveTitle@></a></div>
                <div class="right_photo"><a href="/user/mypage/<@=giveRe.userNo@>"><img src="<@=giveRe.profile@>"/></a></div>
                <div class="right_name"><@=giveRe.nickname@></div>
                <div class="right_time"><@=giveRe.printTime@></div>
            </div>
        </div>
        <div class="popup_bottom">
            <span>
<@=giveRe.content@>
</span>
        </div>
</script>

<script type="text/template" id="giveBoxTmp">
	<@_.each(data, function(dd){@>
    <div class="give_box" data-num="<@=dd.no@>">
        <@if(dd.endStatus==1){@>
        <div class="give_status"><img src="/img/tag-ing.png" width="80px"/><span>진 행</span></div>
        <@}else{@>
        <div class="give_status"><img src="/img/tag-end.png" width="80px"/><span>종 료</span></div>
        <@}@>
        <div class="give_left_box">
            <div class="give_time"><span><@=dd.printTime@></span></div>
            <div class="give_title"><@=dd.title@></div>
            <div class="give_text"><span><@=dd.contents@></span></div>
            <div class="give_last">신청자 수 <@=dd.cnt@> <@=dd.nickname@></div>
        </div>
        <div class="give_right_box"><img src="<@=dd.pic1@>"></div>
    </div><!--.give_box end-->
	<@})@>
</script>
<script type="text/template" id="reviewBoxTmp">
	<@_.each(data, function(dd){@>
    <div class="review_box" data-num="<@=dd.no@>">
        <div class="review_left_box">
            <div class="review_title"><@=dd.title@></div>
            <div class="review_text"><span><@=dd.content@></span></div>
            <div class="review_last"><@=dd.printTime@> · <@=dd.nickname@></div>
        </div><!--.review_left_box end-->
        <div class="review_right_box"><img src="<@=dd.pic1@>"></div>
    </div><!--.review_box end-->
	<@})@>
</script>
<c:import url="/WEB-INF/template/footer.jsp"/>

<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/fix-footer.js"></script>
<script src="/js/header.js"></script>
<script>
	$('.header_box>.give').addClass('on'); // header  tab on 
    var giveBoxTmp = _.template($('#giveBoxTmp').html());
    var reviewBoxTmp = _.template($('#reviewBoxTmp').html());
    var giveReviewTmp = _.template($('#giveReviewTmp').html());
	
    $('.give_tab').click(function(){
        $('.give_tab').removeClass('on');
        $(this).addClass('on');
        $('.give_contents').removeClass('on');
        $('.'+$(this).data('type')).addClass('on');
    });

    // 나중에 num 변수 삭제하고 json 파일로 받아와서 템플릿에서 each문 돌기기
    var givePage = 2;
    var giveSearch = '';
    function giveBoxPrint(){
    	$.ajax({
    		url:"/ajax/give",
    		dataType:"json",
    		data:{'page':givePage++, 'text':giveSearch},
    		error:function(){
    			alert("서버 펑펑!");
    		},
    		success:function(json){
    			$('#give_box_boss').append(giveBoxTmp({"data":json.giveBox}));
    			fixFooter();
    		}
    	});
    }
    var reviewPage = 2;
    var reviewSearch = '';
    function reviewBoxPrint(){
    	$.ajax({
    		url:"/ajax/give",
    		dataType:"json",
    		data:{'page':reviewPage++, 'text':reviewSearch},
    		error:function(){
    			alert("서버 펑펑!");
    		},
    		success:function(json){
    			$('#review_box_boss').append(reviewBoxTmp({"data":json.giveReview}));
    			fixFooter();
    		}
    	});
    }
    
    // 더보기 ~
    $('#give_more_box').click(giveBoxPrint);
    
    // 위와 동일(얘는 리뷰 )
    $('.give_contents').on('click', '#review_more_box', function(){
	   
    	reviewBoxPrint();
    
    });
    	

    //박스 클릭 이벤트(나눔)
    $('#give_box_boss').on('click', '.give_box', function () {
        location.href="/give/"+$(this).data('num');
    });

    //박스 클릭 이벤트(리뷰)
    $('#review_box_boss').on('click', '.review_box', function () {
        //
        //여기 ajax로 값 셋팅
        // alert($(this).data('num'));
        var no = $(this).data('num');
       
        //ex)
        //$('#centerPopup h3').text($(this).data('num')+"번째 후기!");
        getGiveReview(no);
		
        
		
        $('#centerPopup').show();
        $('#reviewPopup').show();
    });//click () end

    function getGiveReview(no){
    	
    	// 김현 추가 
        $.ajax({
        	url:"/give/review/"+no,
			type:"GET",
			dataType:"json",
			success:function(json) {
			//alert("성공");
			 $("#centerPopup").html(giveReviewTmp({giveRe:json})); 
				
			},error:function() {
				alert("에러");
			}
			
		}); //ajax end
    }
    
    
    //검색 엔터 이벤트
    $('.contents .search_box>input').keydown(function (key) {
        if(key.keyCode == 13){
        	// 나눔 
            if($(this).hasClass('give')){
            	giveSearch = $(this).val();
            	givePage=1;
            	$('#give_box_boss').empty();
            	giveBoxPrint();
            }else{
            	reviewSearch = $(this).val();
            	reviewPage=1;
            	$('#review_box_boss').empty();
            	reviewBoxPrint();
            }

        }
    });
    
    

    // 검색 아이콘 이벤트
    $('.contents .search_box>i').click(function(){
    	if($(this).hasClass('give')){
        	giveSearch = $('.contents .search_box>input').val();
        	givePage=1;
        	$('#give_box_boss').empty();
        	giveBoxPrint();
        }else{
        	reviewSearch = $('.review_box>input').val();
        	reviewPage=1;
        	$('#review_box_boss').empty();
        	reviewBoxPrint();
        }
    });
    
    var reviewPopHeight = $('#centerPopup').height();
    $('#centerPopup').css("margin-top",-reviewPopHeight/2);

    var img_left = 0;
    $('#centerPopup').on("click",".popup_center_left>button", function(){
        if($(this).hasClass('popup_left_btn')){
            img_left=img_left-250;
            if(img_left<-750){
                img_left=img_left+250;
            }
        }else{
            img_left=img_left+250
            if(img_left>0){
                img_left=img_left-250;
            }
        }
        $('.move_img_box').css("left",img_left);
    });

    $('#reviewPopup').click(function(){
        $(this).hide();
        $('#centerPopup').hide();
    });
    $('#centerPopup .fa-times').click(function () {
        $('#centerPopup').hide();
        $('#reviewPopup').hide();
    });

    $('.give_add_btn').click(function(){
    	<c:choose>
	    	<c:when test="${loginUser==null }">
	    		alert("로그인이 필요합니다.");
	    	</c:when>
	    	<c:otherwise>
	    		location.href="/give/register";	
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