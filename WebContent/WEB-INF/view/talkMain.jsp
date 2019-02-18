<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>SEMOYO</title>
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/communicationPop.css" />
    <link rel="stylesheet" href="/css/talkMain.css">
</head>

<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>

<div id="talkWrap">
    <div class="searchTag"><input value="${param.ttag}" name="searchTag" placeholder="태그 검색" /><i class="fas fa-search"></i><div class="submit">등록</div></div>
    <div class="talkCardBox">
    	<c:forEach items="${talks }" var="talk">
		    <ul class="talkCard" data-no="${talk.no }">
		        <li><img src="${talk.profile }" width="100" height="100"></li>
		        <li>${talk.nickname }</li>
		        <li>${talk.contents }</li>
		        <li>
		        	<c:forEach items="${talk.tagList }" var="tag">
		        		<span>#${tag.name }</span>		        	
		        	</c:forEach>
		        </li>
		        <li>댓글 ${talk.cnt }</li>
		        <li>${talk.printTime }</li>
		        <c:if test="${talk.pic1 != null }">
		        	<li><img src="${talk.pic1 }" alt="사진" width="200" height="200"></li>
		        </c:if>
		    </ul>
	    </c:forEach>
    </div>
    <div class="moreSee">더보기</div>
</div>

<script type="text/template" id="talkCardTmp">
	<@ _.each(data, function(one) { @>
    <ul class="talkCard" data-no="<@=one.no@>">
        <li><img src="<@=one.profile@>" width="100" height="100"></li>
        <li><@=one.nickname@></li>
        <li><@=one.contents@></li>
		<li>
			<@ _.each(one.tagList, function(tag) { @>
        		<span>#<@=tag.name@></span>	
			<@ }) @>
		</li>
        <li>댓글 <@=one.cnt@></li>
        <li><@=one.printTime@></li>
		<@ if(one.pic1 != null) { @>
        	<li><img src="<@=one.pic1@>" alt="사진" width="200" height="200"></li>
		<@ } @>
    </ul>
	<@ }) @>
</script>



<!-- 은서 : 팝업 추가 -->
<div id="backPop"></div>

<div id="communicationPopBox">
    <div class="cancel_report">
        <i class="fas fa-exclamation-circle"></i>
        <i class="fas fa-times"></i>
    </div><!-- // .cancel_report -->

    <div class="user_info">
        <a href="#"><img class="commu_pop_user_pic" src="/img/윤승아.jpg" width="100" height="100"></a>
        <em class="commu_pop_user_nickname"><a href="#">승공주</a></em>
        <span class="commu_pop_user_write_time">2018년 12월 27일 오후 7시 51분</span>
    </div><!-- // .user_info -->

    <div class="commu_pop_contents_wrap">
        <ul class="commu_pop_pics">
           
        </ul>

        <div class="commu_pop_contents">
        
            오늘 제가 먹은 것들이에용~~~ ㅎㅎ 넘 맛있겠쥬? 호호호 정말 세상 맛있었답니다 ㅎㅎㅎ
        </div>

        <div class="commu_pop_tags">
            <img src="/img/tag.png" width="40" height="40">
            <em>태그</em>
            <div class="commu_pop_tags_box">
                <span><a href="#">#가dfdfdfd</a></span>
                <span><a href="#">#나sfsdfsfsdfsdfsdfsd</a></span>
                <span><a href="#">#다sfsdfsdsddsfsd</a></span>
                <span><a href="#">#라sdfgaerge</a></span>
            </div>
        </div><!-- // .commu_pop_tags -->

        <div class="commu_pop_like">
            <i class="fas fa-heart"></i>
            <span>좋아요</span>
            <em>56</em>
        </div><!-- // .commu_pop_like -->

        <div class="commu_pop_comments_wrap">
            <div class="commu_pop_comment_register">
                <input id="commu_pop_comment_register_con" name="comment" placeholder="내용을 입력해주세요.">
                <button>등록</button>
            </div>
            <div class="commu_pop_only_comments">
            <%--  
            	<c:forEach items="${reviews }" var="review">
	                <div class="commu_pop_comment_one">
	                    <div class="commu_pop_comment_one_delete">
	                        <span>삭제</span>
	                    </div>
	                    <a href="#"><img src="${review.profile }" width="80" height="80"></a>
	                    <span><a href="#">${review.nickname }</a></span>
	                    <span class="commu_pop_comment_date">${review.printTime }</span>
	                    <div class="commu_pop_comment_con">
	                        ${review.contents }
	                    </div>
	                </div><!-- // .commu_pop_comment_one -->
                </c:forEach>
                --%>
                
            </div><!-- // .commu_pop_only_comments -->
					<!-- <@if(userNo != 0 && userNo == comment.userNo) {@>
					<@}@> -->

            <script type="text/template" id="commentPop">
				<@_.each(comments, function(comment){@>
                <div class="commu_pop_comment_one" >
					<@if(${loginUser!=null?loginUser.no:0} == comment.userNo) {@>
                    	<div class="commu_pop_comment_one_delete" data-reviewNo="<@=comment.no@>">
                        	<span>삭제</span>
						</div>
					<@}@>                    
                    <a href="/user/mypage/" + <@=comment.userNo@>><img src="<@=comment.profile@>" width="80" height="80"></a>
                    <span><a href="#"><@=comment.nickname@></a></span>
                    <span class="commu_pop_comment_date"><@=comment.printTime@></span>
                    <div class="commu_pop_comment_con">
                        <@=comment.contents@>
                    </div>
                </div><!-- // .commu_pop_comment_one -->
				<@})@>
            </script>

            <div class="commu_pop_more">더보기</div>

        </div><!-- // .commu_pop_comments_wrap -->
    </div><!-- // .commu_pop_contents_wrap -->
</div><!-- // #communicationPopBox -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>




</body>
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/fix-footer.js"></script>
<script src="/js/header.js"></script>
<script>

    $('.header_box>.commu').addClass('on');
    
	var pageNum = 2;
	var word = "";
	
	
	
    $(".moreSee").click(talkMore);
    
    var talkCardTmp = _.template($("#talkCardTmp").html());
    
    // 은서 : 더보기 클릭 시 더 나옴
    function talkMore() {
		$.ajax({
			url: "/ajax/talk",
			data: {"pageNo": pageNum++, "word": word},
			dataType: "json",
			error: function() {
				alert("에러");
			},
			success: function(json) {
				$('.talkCardBox').append(talkCardTmp({"data":json}));
			}
			
		});
	}


   /* var eq =$(this).index();

    $(".talkCard li:nth-child(7)").eq(eq).click(function () {

    });
*/
    
    // 은서 : 팝업 ajax
    $("#talkWrap").on("click",".talkCard",function () {
    	
    	talknum = $(this).data("no");
    	
    	
    	// console.log(talknum);
    	
    	$.ajax({
			url: "/ajax/talk/"+talknum,
			dataType: "json",
			error: function() {
				alert("에러");
			},
			success: function(json) {
				$('.commu_pop_user_pic').attr('src', json.talkOne.profile);
				$(".commu_pop_user_nickname>a").text(json.talkOne.nickname);
				$(".user_info a").attr("href", "/user/mypage/" + json.talkOne.userNo);
				$(".commu_pop_user_write_time").text(json.talkOne.writeTime);
				// alert(json.checkLike);
				if(json.checkLike-0 == 1){
					$(".commu_pop_like i").removeClass('far').addClass('fas');	
				}else{
					$(".commu_pop_like i").removeClass('fas').addClass('far');
				}
				
				$(".commu_pop_like em").text(json.likes.cnt);
				
				var picArry = new Array(json.talkOne.pic1,
				json.talkOne.pic2,
				json.talkOne.pic3,
				json.talkOne.pic4,
				json.talkOne.pic5);
				// var pCount = 0;
				$('.commu_pop_pics').empty();
				for(var i=0; i<5; i++) {
					if(picArry[i] != null) {
						$('.commu_pop_pics').append($("<li class=\"commu_pop_pic_one\"><img src="+picArry[i]+" width=\"180\" height=\"180\"></li>"));
					}
				}
				$(".commu_pop_contents").text(json.talkOne.contents);
				
				$('.commu_pop_tags_box').empty();
				_.each(json.tagList, function(tag){
					$('.commu_pop_tags_box').append($("<span><a href=\"/talk?ttag="+tag.name+"\">#" + tag.name + "</a></span>"));	
				});
				$('.commu_pop_only_comments').empty();
				$('.commu_pop_only_comments').append(commentsPop({'comments':json.reviews, "userNo":0}));
				
			}			
		});    	
    	
        $("#backPop").show();
        $("#communicationPopBox").show();
    });
	
    // 닫기 클릭 시 꺼짐
    $(".cancel_report .fa-times").click(function () {
        $("#communicationPopBox").hide();
        $("#backPop").hide();
    });
    // 뒤 배경 누를 시 꺼짐
    $("#backPop").click(function () {
        $("#communicationPopBox").hide();
        $("#backPop").hide();
    });
    
    // 은서 : 좋아요
    var talknum = -1;
    
    	$(".commu_pop_like").on("click", function () {
    		
    		if(${loginUser == null}) {
    			alert("로그인 해주세요!");
    		} else {
    			// alert(talknum);
            	$.ajax({
            		url: "/ajax/talk/like",
            		dataType: "text",
            		data: {"no": talknum},
            		error: function() {
        				alert("에러");
        			},
            		success: function() {
            			if($(".commu_pop_like i").hasClass('far')) {
            	            $(".commu_pop_like i").removeClass('far').addClass('fas');
            	            $(".commu_pop_like em").text($(".commu_pop_like em").text()-0+1);
            	        }else{
            	            $(".commu_pop_like i").removeClass('fas').addClass('far');
            	            $(".commu_pop_like em").text($(".commu_pop_like em").text()-1);
            	        }
        				
        			}
            	});
    		}
        	
        });

    	
    
    // 태그 검색
    $(".searchTag>input").keydown(function(key) {
    	if(key.keyCode == 13) {
    		var searchTag = $(this).val();
    		word= searchTag;
    		pageNum =1;
    		$('.talkCardBox').empty();
    		talkMore();    	
    		fixFooter();
    	}    	
    });
    
    
    
    <c:if test="${param.ttag.length()>0}">
	    var searchTag = '${param.ttag}';
		word= searchTag;
		pageNum =1;
		$('.talkCardBox').empty();
		talkMore();    	
		fixFooter();
    </c:if>
    
      
    
	// 글 하나 클릭 시 팝업 뜨는 것
    var commentsPop = _.template($("#commentPop").html());

    var pageNumPop = 2;
    $(".commu_pop_more").click(function () {
    	
    	$.ajax({
			url: "/ajax/talk/comments/" + talknum,
			data: {"pageNo": pageNumPop++},
			dataType: "json",
			error: function() {
				alert("에러");
			},
			success: function(json) {
        		$('.commu_pop_only_comments').append(commentsPop({"comments":json.reviewList, "userNo":json.loginUserNo}));
			}
			
		});
    	
    });
    
    // 소통 댓글 insert
    $(".commu_pop_comment_register button").click(function() {
    	
    	if(${loginUser == null}) {
    		alert("로그인 해주세요!");
    	} else {
    		
    		$.ajax({
    			url: "/ajax/talk/comments/" + talknum,
    			data: {"pageNo": pageNumPop++, "contents": $("#commu_pop_comment_register_con").val()},
    			type: "POST",
    			dataType: "text",
    			error: function() {
    				alert("에러");
    			},
    			success: function() {
    				pageNumPop=1;
    				$.ajax({
    					url: "/ajax/talk/comments/" + talknum,
    					data: {"pageNo": pageNumPop++},
    					dataType: "json",
    					error: function() {
    						alert("에러");
    					},
    					success: function(json) {
    						$('.commu_pop_only_comments').empty();
    						$('#commu_pop_comment_register_con').val('');
    						$('.commu_pop_only_comments').append(commentsPop({"comments":json.reviewList, "userNo":json.loginUserNo}));
    					}
    					
    				});
            		
    			}
    			
    		});
    		
    	}
		
	});
    
    // 소통 댓글 delete
    $(".commu_pop_only_comments").on("click", ".commu_pop_comment_one_delete", function() {
    	
    	
    	var deleteFlag = confirm("정말 삭제하시겠습니까?");
    	
    	if(deleteFlag) {
    		
    		$.ajax({
    			url: "/ajax/talk/comments/" + $(this).data('reviewno'),
    			type: "DELETE",
    			dataType: "text",
    			error: function() {
    				alert("에러");
    			},
    			success: function() {
    				pageNumPop=1;
    				$.ajax({
    					url: "/ajax/talk/comments/" + talknum,
    					data: {"pageNo": 1},
    					dataType: "json",
    					error: function() {
    						alert("에러");
    					},
    					success: function(json) {
    						$('.commu_pop_only_comments').empty();
    						$('.commu_pop_only_comments').append(commentsPop({"comments":json.reviewList, "userNo":json.loginUserNo}));
    					}
    					
    				});
            		
    			}
    			
    		});
    		
    	}
    		
    		
    		
	});

    // 등록하기 버튼 클릭시 등록 페이지로 이동.
    $(".submit").click(function () {
    	if(${loginUser != null}) {
        	location.href = "/talk/insert";    		
    	} else {
    		alert("로그인을 해주세요!");
    	}
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
</html>