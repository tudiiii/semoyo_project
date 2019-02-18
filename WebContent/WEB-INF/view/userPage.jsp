<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/css/userPage.css" />
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/notosanskr.css" />
<link rel="stylesheet" href="/css/header_footer.css" />
<link rel="stylesheet" href="/css/tipMain.css" />
<link rel="stylesheet" href="/css/give.css" />
<link rel="stylesheet" href="/css/talkMain.css" />
<link rel="stylesheet" href="/css/tipMain.css" />
<link rel="stylesheet" href="/css/communicationPop.css" />


</head>
<style>
#footer.fixed{
position: relative;
bottom: -134px;
}
</style>
<body>

	<c:import url="/WEB-INF/template/header.jsp"></c:import>


	<div id="MyWrap">
		<div class="MyHeader">
			<div class="headerList">
				<img src="${loginUser.profile }" width="50" height="50"> <span
					class="nick">${loginUser.nickname}</span>
				<div class="pointImg">
					<i class="fas fa-dollar-sign"></i>
				</div>
				<div class="point">${loginUser.point}</div>
				<div class="pointName">보유 포인트</div>
				<c:if test="${loginUser.no == userNo }">
					<i class="fas fa-cogs"></i>
				</c:if>
			</div>
			<img class="headerImg" src="/img/8.jpg" />
		</div>
		<div class="Mytab">
			<ul class="tabList">
		        <li class="on" data-value="recipe"><a>레시피</a></li>
	            <li data-value="honey"><a>꿀팁</a></li>
	            <li data-value="talk"><a>소통</a></li>
	            <li data-value="give"><a>나눔</a></li>
	            <li data-value="scrap"><a>스크랩</a></li>
			</ul>
		</div>
		<div class="MyContents" id="MyContents">
			
		</div>
		<div class="moreSee">더보기</div>

		<div class="popupHistory">
			<ul class="popupList">
				<i class="fas fa-times"></i>
				<li>레시피 <a>1</a>번 글에서 <a>10</a>포인트 획득
				</li>
				<li>꿀팁 <a>3</a>번 글에서 <a>20</a>포인트 획득
				</li>
				<li>나눔 <a>4</a>번 글에서 <a>100</a>포인트 획득
				</li>
			</ul>
		</div>
		<div class="dark"></div>
	</div>
	<div class="modify">
		<ul class="modifyList">
			<i class="fas fa-times"></i>
			<li><label>커버배경 수정<input type="file" /></label>
			<div></div></li>
			<li><label>프로필 수정<input type="file" /></label>
			<div></div></li>
			<li><a>회원탈퇴</a></li>
		</ul>
	</div>
	<div class="dark"></div>
	</div>

	<c:import url="/WEB-INF/template/footer.jsp"></c:import>

	<div id="documentTop">
		<a href="#header">TOP</a>
	</div>
	<!--footer end -->
	
	<script src="/js/moment-with-locales.js"></script>
	
	<!-- 레시피 -->
	<script type="text/template" id="myRecipeTmp">
<@_.each(listTmpl, function(data){@>
    <ul class="contentsList" data-no="<@=data.no@>">
        <li><@=data.title@></li>
        <li><@=moment(data.regdate).format("YYYY-MM-DD HH:mm")@></li>
        <li><@=data.contents@></li>
        <li><i class="far fa-heart"></i> <@=data.likeNo@></li>
        <li><i class="far fa-bookmark"></i> <@=data.scrapNo@></li>
        <li><i class="far fa-eye"></i> <@=data.read@></li>
        <li><img src="<@=data.pic@>" width="180" height="180"></li>
    </ul>
<@})@>
	</script>

	<!-- 꿀팁  -->
	<script type="text/template" id="myHoneyTmp">
	<@_.each(listTmpl, function(data){@>
	<div class="tip_content" data-no="<@=data.no@>">
			<div class="content_category"><img class="category_img" src="/img/tag-ing.png"><span class="category_text">조합</span></div>
			<div class="content_title"><@=data.title@></div>
			<div class="content_content"><@=data.content@></div>
			<div class="content_info">댓글 <@=data.countNo@> | <@=moment(data.regdate).format("YYYY-MM-DD HH:mm")@> | <@=data.nickname@></div>
		</div>
	<@})@>
	</script>

	
	<!-- 소통 -->
	<script type="text/template" id="myTalkTmp">
<@_.each(listTmpl, function(data){@>
    <ul class="talkCard" data-no="<@=data.no@>">
        <li><img src="<@=data.profile@>" width="100" height="100"></li>
        <li><@=data.nickname@></li>
        <li><@=data.contents@></li>
        <li> #겨울 #춥다</li>
        <li>댓글 <@=data.countNo@></li>
        <li><@=moment(data.regdate).format("YYYY-MM-DD HH:mm")@></li>
        <li><img src="<@=data.pic1@>" alt="사진" width="200" height="200"></li>
    </ul>
<@})@>
    </script>

    
	
	<!-- 나눔 -->
	<script type="text/template" id="myGiveTmp">
<@_.each(listTmpl, function(data){@>
    <div class="give_box" data-no="<@=data.no@>">
        <@if(data<=3){@>
        <div class="give_status"><img src="/img/tag-ing.png" width="80px"/><span>진 행</span></div>
        <@}else{@>
        <div class="give_status"><img src="/img/tag-end.png" width="80px"/><span>종 료</span></div>
        <@}@>
        <div class="give_left_box">
            <div class="give_time"><span><@=moment(data.regdate).format("YYYY-MM-DD HH:mm")@></span></div>
            <div class="give_title"><@=data.title@></div>
            <div class="give_text"><span><@=data.contents@></span></div>
            <div class="give_last">신청자 수 <@=data.countNo@> <@=data.nickname@></div>
        </div>
        <div class="give_right_box"><img src="<@=data.pic1@>"></div>
    </div><!--.give_box end-->
<@})@>
	</script>


	<!-- 스크랩 -->
	<script type="text/template" id="myScrapTmp">
<@_.each(listTmpl, function(data){@>
	<ul class="contentsList" data-no="<@=data.typeNo@>">
            <li><@=data.title@></li>
            <li><@=moment(data.regdate).format("YYYY-MM-DD HH:mm")@></li>
            <li><@=data.contents@></li>
            <li><i class="far fa-heart"></i> <@=data.likeNo@></li>
            <li><i class="far fa-bookmark"></i> <@=data.scrapNo@></li>
            <li><i class="far fa-eye"></i> <@=data.read@></li>
            <li><img src="<@=data.pic@>" width="300" height="300"></li>
            <li>by <@=data.nickname@></li>
        </ul>
<@})@>
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
                    <a href="#"><img src="<@=comment.profile@>" width="80" height="80"></a>
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
        
        
	<script src="/js/underscore-min.js"></script>
	<script src="/js/jquery.js"></script>
	<script src="/js/fix-footer.js"></script>
	<script src="/js/header.js"></script>
	<script>
	
	var pageNo = 1;
	var userNo = ${userNo };
	
	
	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@([\s\S]+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
	};
	
	
	var myGiveTmp = _.template($("#myGiveTmp").html());
	var myTalkTmp = _.template($("#myTalkTmp").html());
	var myScrapTmp = _.template($("#myScrapTmp").html());
	var myHoneyTmp = _.template($("#myHoneyTmp").html());
	var myRecipeTmp = _.template($("#myRecipeTmp").html());
	
	function recipe(a){
	    	
	    	console.log(pageNo);
	    	
	    	$.ajax({
	    		url:"/ajax/user/mypage/recipe",
	    		type:"GET",
	    		dataType:"json",
	    		data:{
	    			"start": pageNo,
					"userNo": userNo
	    		},
	    		error:function(jqXHR, textStatus, errorThrown){
	 	            alert("에러 발생~~ ");
	 	        },
	 	        success:function(json){
	 	        	
	 	        	console.log(json);
	 	        	
	 	        	if(a==1){
	 	        		$("#MyContents").append(myRecipeTmp({listTmpl:json}));
	 	        	}else{
	 	        		$("#MyContents").html(myRecipeTmp({listTmpl:json}));	
	 	        	}
	 	
	 	        }//sueccess end
	    	});//$.ajax() end
	    }//recipe();
	    
	    recipe(0);
	
	function honey(a){
	    	
	    	console.log(pageNo);
	    	
	    	$.ajax({
	    		url:"/ajax/user/mypage/honey",
	    		type:"GET",
	    		dataType:"json",
	    		data:{
	    			"start": pageNo,
					"userNo": userNo
	    		},
	    		error:function(jqXHR, textStatus, errorThrown){
	 	            alert("에러 발생~~ ");
	 	        },
	 	        success:function(json){
	 	        	
	 	        	console.log(json);
	 	        	
	 	        	if(a==1){
	 	        		$("#MyContents").append(myHoneyTmp({listTmpl:json}));
	 	        	}else{
	 	        		$("#MyContents").html(myHoneyTmp({listTmpl:json}));	
	 	        	}
	 	
	 	        }//sueccess end
	    	});//$.ajax() end
	    }//honey();
	    
function talk(a){
	    	
	    	console.log(pageNo);
	    	
	    	$.ajax({
	    		url:"/ajax/user/mypage/talk",
	    		type:"GET",
	    		dataType:"json",
	    		data:{
	    			"start": pageNo,
					"userNo": userNo
	    		},
	    		error:function(jqXHR, textStatus, errorThrown){
	 	            alert("에러 발생~~ ");
	 	        },
	 	        success:function(json){
	 	        	
	 	        	console.log(json);
	 	        	
	 	        	if(a==1){
	 	        		$("#MyContents").append(myTalkTmp({listTmpl:json}));
	 	        	}else{
	 	        		$("#MyContents").html(myTalkTmp({listTmpl:json}));	
	 	        	}
	 	
	 	        }//sueccess end
	    	});//$.ajax() end
	    }//talk();
	    
function give(a){
	    	
	    	console.log(pageNo);
	    	
	    	$.ajax({
	    		url:"/ajax/user/mypage/give",
	    		type:"GET",
	    		dataType:"json",
	    		data:{
	    			"start": pageNo,
					"userNo": userNo
	    		},
	    		error:function(jqXHR, textStatus, errorThrown){
	 	            alert("에러 발생~~ ");
	 	        },
	 	        success:function(json){
	 	        	
	 	        	console.log(json);
	 	        	
	 	        	if(a==1){
	 	        		$("#MyContents").append(myGiveTmp({listTmpl:json}));
	 	        	}else{
	 	        		$("#MyContents").html(myGiveTmp({listTmpl:json}));	
	 	        	}
	 	
	 	        }//sueccess end
	    	});//$.ajax() end
	    }//give();
	    
function scrap(a){
	    	
	    	console.log(pageNo);
	    	
	    	$.ajax({
	    		url:"/ajax/user/mypage/scrap",
	    		type:"GET",
	    		dataType:"json",
	    		data:{
	    			"start": pageNo,
					"userNo": userNo
	    		},
	    		error:function(jqXHR, textStatus, errorThrown){
	 	            alert("에러 발생~~ ");
	 	        },
	 	        success:function(json){
	 	        	
	 	        	console.log(json);
	 	        	
	 	        	if(a==1){
	 	        		$("#MyContents").append(myScrapTmp({listTmpl:json}));
	 	        	}else{
	 	        		$("#MyContents").html(myScrapTmp({listTmpl:json}));	
	 	        	}
	 	
	 	        }//sueccess end
	    	});//$.ajax() end
	    }//scrap();
	    
	
		//히스토리
		$(".fa-dollar-sign").click(function() {
			$(".popupHistory").show();
			$(".dark").show();
		});
		$(".dark").click(function() {
			$(".popupHistory").hide();
			$(".dark").hide();
		});
		$(".fa-times").click(function() {
			$(".popupHistory").hide();
			$(".dark").hide();
		});
		//정보수정
		$(".fa-cogs").click(function() {
			$(".modify").show();
			$(".dark").show();
		});
		$(".dark").click(function() {
			$(".modify").hide();
			$(".dark").hide();
		});
		$(".fa-times").click(function() {
			$(".modify").hide();
			$(".dark").hide();
		});

		$(".tabList li").click(function() {
			$(".on").removeClass("on").before();
			$(this).addClass("on");
			pageNo=1;
			if ($(".tabList li:nth-child(1)").hasClass("on") == true) {
				recipe(0);
			} else if ($(".tabList li:nth-child(2)").hasClass("on") == true) {
				honey(0);
			} else if ($(".tabList li:nth-child(3)").hasClass("on") == true) {
				talk(0);
			} else if ($(".tabList li:nth-child(4)").hasClass("on") == true) {
				give(0);
			} else if ($(".tabList li:nth-child(5)").hasClass("on") == true) {
				scrap(0);
			} 
		});

		var myRecipeTmp = _.template($('#myRecipeTmp').html());

		$(".moreSee").click(function() {
			
			pageNo++;
			var value = $(".tabList .on").attr("data-value");
		    switch(value){
		    	case "recipe":recipe(1);
	            break;
	            case "honey": honey(1);
	            break;
	            case "talk": talk(1);
	            break;
	            case "give":give(1);
	            break;
	            case "scrap":scrap(1);
	            break;
	            default:break;
		    }
			
		});

		$(".MyContents ").on("click", ".fa-heart", function() {

			if ($(this).hasClass("far fa-heart")) {
				$(this).attr("class", "fas fa-heart");
			} else {
				$(this).attr("class", "far fa-heart");
			}
		});

		$(".MyContents ").on("click", ".fa-bookmark", function() {

			if ($(this).hasClass("far fa-bookmark")) {
				$(this).attr("class", "fas fa-bookmark");
			} else {
				$(this).attr("class", "far fa-bookmark");
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
		
		/// 레시피 클릭시 
		$('.MyContents').on('click', '.contentsList', function(){
			location.href="/recipe/"+$(this).data("no");
		});
		
		
		// 소통
		
		// 은서 : 팝업 ajax
    $("#MyContents").on("click",".talkCard",function () {
    	
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
	    	
	    	$('#MyContents').on('click', '.give_box', function () {
	            location.href="/give/"+$(this).data('no');
	        });

		
	
	</script>
</body>
</html>