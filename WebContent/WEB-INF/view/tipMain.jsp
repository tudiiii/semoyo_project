<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>꿀팁 메인</title>
	<c:import url="/WEB-INF/template/link.jsp"></c:import>
	<link rel="stylesheet" href="/css/tipMain.css"/>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>
<!---------------------------------------------------------------------------------------------------->


<div id="backPop"></div>

    <div id="tipPopBox">


        <div class="cancel_report">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-times"></i>
        </div><!-- // .cancel_report -->

        <div class="user_info">
            <a href="#"><img class="tip_pop_user_pic" src="" width="100" height="100"></a>
            <strong class="tip_pop_user_nickname"><a href="#">로딩중..</a></strong>
            <span class="tip_pop_user_write_time">로딩중..</span>
        </div><!-- // .user_info -->

        <div class="tip_pop_contents_wrap">
            <div class="tip_pop_title">
                <span>로딩중..</span> <img src="img/beehive.png" width="50" height="50">
            </div>

            <div class="tip_pop_contents">
                로딩중..
            </div>


<div class="tip_pop_go">
            <div class="tip_pop_go_one">
                    <span class="count"></span>
                    <div class="tip_pop_go_one_contents">
                        <div class="tip_pop_go_one_con">111111111111111</div>
                        <img src="img/라면.jpg" width="150" height="150">
                    </div>
                </div><!-- // .tip_pop_go_one -->

</div><!-- // .tip_pop_go -->
<script type="text/template" id="tipListTmp">
	
	<@_.each(tiplists, function(tiplist) { @>
                <div class="tip_pop_go_one">
                    <span class="count"><@=number++@> Go</span>
                    <div class="tip_pop_go_one_contents">
                        <div class="tip_pop_go_one_con"><@=tiplist.contents@></div>
					<@ if(tiplist.pic!=null) { @>
                        <img src="<@=tiplist.pic@>" width="150" height="150">
					<@}@>
                    </div>
                </div><!-- // .tip_pop_go_one -->
	<@ })@>
</script>

<div class="tip_pop_like_scrap">
                <div class="tip_pop_like">
                    <i class="fas fa-heart"></i>
                    <span>좋아요</span>
                    <strong >...</strong>
                </div>
                <div class="tip_pop_scrap">
                    <i class="far fa-bookmark"></i>
                    <span>스크랩</span>
                    <strong>...</strong>
                </div>
</div><!-- // .tip_pop_like_scrap -->

            

            <div class="tip_pop_comments_wrap">
                <div class="tip_pop_comment_register">
                    <input name="comment" placeholder="내용을 입력해주세요.">
                    <button type="button" class="CommentAddBtn">등록</button>
                </div>
                <div class="tip_pop_only_comments">
                   <!--  <div class="tip_pop_comment_one">
                        <div class="tip_pop_comment_one_delete">
                            <span>삭제</span>
                        </div>
                        <a href="#"><img src="img/지창욱.PNG" width="80" height="80"></a>
                        <span><a href="#">창우기</a></span>
                        <span class="tip_pop_comment_date">2018년 12월 29일 오후 03시 52분</span>
                        <div class="tip_pop_comment_con">
                            웅아ㅓㅗ아ㅗ아ㅗ나ㅘㄹ넘와와와와와ㅗ아ㅗ아ㅗ아ㅗ아ㅘ옹
                        </div>
                    </div>// .commu_pop_comment_one -->
                </div><!-- // .tip_pop_only_comments -->

                <script type="text/template" id="commentPop">
					<@_.each(comlist, function(com) { @>
                    <div class="tip_pop_comment_one" data-num=<@=com.no@>>
                        <div class="tip_pop_comment_one_delete">
						<span class="comDel">삭제</span>
                    </div>
                        <a href="#"><img src="<@=com.profile@>" width="80" height="80"></a>
                        <span><a href="#"><@=com.nickname@></a></span>
                        <span class="tip_pop_comment_date"><@=moment(com.regdate).lang('kr').format('YYYY년 MM월 DD일 A hh시 mm분')@></span>
                        <div class="tip_pop_comment_con">
                            <@=com.contents@>
                        </div>
                    </div><!-- // .commu_pop_comment_one -->
					<@})@>	
                </script>

                <div class="tip_pop_more">더보기</div>
            </div><!-- // .tip_pop_comments_wrap -->

        </div><!-- // .tip_pop_contents_wrap -->

    </div><!-- // #tipPopBox -->
    


<!----------------------------------------------------------------------------------------------->


<div id="background1080">

	<div id="searchingAndWriteBox">
		<div id="searchingBox">
			
				<input name="tip" id="searchingInput" placeholder="제목, 작성자 검색"/>
				<button type="button" class ="searchBtn"><i class="fas fa-search"></i></button>
		
		</div>
		<div id="writeBox">
		<form action="/addTip" method="get">
			<button id="writeButton">등록하기</button>
		</form>
		</div>
	</div>

	<div id="tipCategoryBox">
		<div id="tipTitle">꿀팁별</div>
		<div id="category">
			<input name="category" type="radio" id="all" class="radio_button" checked><label for="all" class="radio_label all">전체</label>
			<input name="category" type="radio" id="trim" class="radio_button"><label for="trim" class="radio_label trim">손질</label>
			<input name="category" type="radio" id="keep" class="radio_button"><label for="keep" class="radio_label keep">저장</label>
			<input name="category" type="radio" id="mix" class="radio_button"><label for="mix" class="radio_label mix">조합</label>
			<input name="category" type="radio" id="other" class="radio_button"><label for="other" class="radio_label other">기타</label>
		</div>
	</div>


	<div id="contentsBox">

		<div id="orderBox">
			<input name="order" type="radio" id="new" class="radio_button" checked><label for="new" class="radio_label order_label">최신순</label>
			<input name="order" type="radio" id="best" class="radio_button"><label for="best" class="radio_label order_label">인기순</label>
		</div>

		<!--사진있는 컨텐츠-->
		<div class="tip_content">
			<div class="content_category"><img class="category_img" src="img/tag-ing.png"><span class="category_text">조합</span></div>
			<div class="content_title">여기 제목 들어감</div>
			<div class="content_content">내용 들어감~~~~~~~</div>
			<div class="content_picture">
				<img src="img/food.jpg" class="pic"/>
			</div>
			<div class="content_info">댓글 3 | 39분전 | 아르띠</div>
		</div>


		<div id="listView">

<script type="text/template" id="listTmpl">
<@_.each(honeys, function(honey) { @>
		<!--사진 없는 컨텐츠 : non_pic -->
		<div class="tip_content non_pic" data-no="<@=honey.no@>">
			<div class="content_category"><img class="category_img" src="img/tag-ing.png"><span class="category_text"><@=honey.type@></span></div>
			<div class="content_title"><@=honey.title@></div>
			<div class="content_content"><@=honey.content@></div>
			<div class="content_info">댓글 <@=honey.cnt@> | <@=honey.printTime@> | <@=honey.nickname@></div>
		</div>
<@})@>
</script>

		</div>
		
	</div>
<button id="moreViewButton">더 보기</button>

</div>


<!------------------------------------------------------------------------>

<c:import url="/WEB-INF/template/footer.jsp"></c:import>
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/fix-footer.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script src="/js/header.js"></script>

<script>
$('.header_box>.tip').addClass('on'); // header  tab on 

//컨텐츠 클릭시 팝업 뜸
$("body").on("click", ".tip_content", function () {
	$("#tipPopBox").show();
	$("#backPop").show();
});



if(${loginUser==null}){
	$("#writeButton").hide();
}

_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@([\s\S]+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};

////////////////텝 클릭시 카테고리벨 셀렉///////////////////////////
var tmp = _.template($("#listTmpl").html());

$("#category").on('click','.trim',function() {
	$("#contentsBox").empty();
	pageNum =1;
	type="손질";
	moreList(type,pageNum++);
	

})//click end

$("#category").on('click','.keep',function() {

	$("#contentsBox").empty();
	pageNum =1;
	type="저장";
	moreList(type,pageNum++);

})//click end
	
	$("#category").on('click','.mix',function() {
		
		$("#contentsBox").empty();
		pageNum =1;
		type="조합";
		moreList(type,pageNum++);

})//click end
		
		$("#category").on('click','.other',function() {
			
			$("#contentsBox").empty();
			pageNum =1;
			type="기타";
			moreList(type,pageNum++);

})//click end

////////////전체출력인데 안필요함 근데 아까워서 안지움//////////////////
function all(){

	$.ajax({
		url:"/ajax/selectHoneyAllList",
		dataType:"json",
		error:function() {
			alert("서버 점검중!");
		},
		success:function(json) {
			
			$("#contentsBox").html(tmp({honeys:json}));
		}
}) //ajax end

}// function end	
//////////////////////

			
			$("#category").on('click','.all',function() {
				
				$("#contentsBox").empty();
				pageNum =1;
				type="";
				moreList(type,pageNum++);

})//click end
///////////////////////////////////////////////////////////////


////////꿀팁메인 더보기 처리/////////////
$("#moreViewButton").click(function () {
		//alert("d")
		moreList(type,pageNum++);
		
	});


	var pageNum = 1;
	var type = "";
	
	$("#contentsBox").empty();
	
	////꿀팁메인 기본전체 select///
	moreList(type,pageNum++);
	///////////////////
	
	function moreList(type , no){

		$.ajax({
			url:"/ajax/selectHoneyList",
			data:{"pageNO":no, "type":type},
			dataType: "json",
			error: function() {
				alert("에러");
			},
			success: function(json) {
				//$('.tip_pop_only_comments').append(commentsPop({"data":json}));
				$("#contentsBox").append(tmp({honeys:json}));
			}
		});
   
};

			
	
	/////////////////////////제목검색 시 메인카드인서트//////////////////////////////
	var val = $("#searchingInput").val();
	
 	$(".searchBtn").click(function() {
 		val = $("#searchingInput").val();
 		 if(val.length!=0){
 			filter();
 		}else{
 		
 			$("#contentsBox").empty();
			pageNum =1;
			type="";
			moreList(type,pageNum++);
 		}//if end  
	});
		$("#searchingInput").on("keyup",function (e) {

			 if(e.keyCode==13) {
				// e.keyCode==0;
				 val = $("#searchingInput").val();
				 if(val.length!=0){
						filter();
					}else{
					
						$("#contentsBox").empty();
						pageNum =1;
						type="";
						moreList(type,pageNum++);
					}//if end  
			} 			
	});
		
	
	
	function filter(){
		
		$.ajax({
			url:"/ajax/searchList",
			dataType:"json",
			data:{nickName:'%'+val+'%',title:'%'+val+'%'},
			error:function() {
				alert("서버 점검중!");
			},
			success:function(json) {
				
				$("#contentsBox").html(tmp({honeys:json}));
			}
		})
		
	}//function end 

	//////////////////////////////////////////////////////////

	/////////////////////////////꿀팁상세팝업셀렉트(댓글포함)//////////////////////
	 var listTmp =_.template($("#tipListTmp").html());
	//var oneTmp = _.template($("#tipOneTmp").html());
	
	//밑에 댓글//
	var commentsPop = _.template($("#commentPop").html());
	
	var eq = -1;
	$('#contentsBox').on('click','.tip_content',function() {
		eq =$(this).data('no');
		//alert(eq);
		$('.tip_pop_only_comments').empty();
		comSelect();
		go();
	
	}); 
	
	function comSelect() {
	
		$.ajax({
			url:"/ajax/selectTipDetail",
			dataType:"json",
			data:{no:eq},
			error:function() {
				alert("서버 점검중!");
			},
			success:function(json) {
				pageNo = 2;
				$('.tip_pop_user_pic').attr("src",json.tipone.profile);
				$('.tip_pop_user_nickname a').text(json.tipone.nickname);
				$('.tip_pop_user_write_time').text(json.tipone.printTime);
				$('.tip_pop_title span').text(json.tipone.title);
				$('.tip_pop_contents').text(json.tipone.content);
				//$("#tipPopBox").html(oneTmp({tipone:json.tipone}));
				$(".tip_pop_go").empty();
				$(".tip_pop_go").append(listTmp({'tiplists':json.tiplist, "number": 1}));
				
				//댓글select
				$('.tip_pop_only_comments').append(commentsPop({comlist:json.tipCom}));
				
				// 좋아요
					if(json.likeCheck) {
						$(".tip_pop_like i").removeClass('fas').addClass('far');  
						
         	        }else{     	        	
         	        	$(".tip_pop_like i").removeClass('far').addClass('fas');
         	        }
				
    			$(".tip_pop_like strong").text(json.count);
    			
    			console.log("json.cnt :: "+json.count);
    			
    			// 스크랩
    			if(json.scrapCheck) {
    					$(".tip_pop_scrap i").removeClass('fas').addClass('far');
    				}else{
    					$(".tip_pop_scrap i").removeClass('far').addClass('fas');
    				
    				}
    			$(".tip_pop_scrap strong").text(json.scrapCnt); 
				
			}
		})
		
	}//function end
	////////////////////////////////////////////////////////////////
	
	var pageNo = 1;
	
	///////////////꿀팁상세댓글더보기////////////////////////
	$(".tip_pop_more").click(function() {
		
		$.ajax({
			url:"/ajax/comMore",
			data:{"pageNo":pageNo++,"type":eq},
			type:"get",
			dataType:"json",
			error:function() {
				alert("서버 점검중!");
			},
			success:function(json) { 
				$('.tip_pop_only_comments').append(commentsPop({comlist:json}));
			}
		});
		
	})
	
	/////////////////////////////////////////////////

	
	////////////////////////////꿀팁상세 팝업 댓글 인서트/////////////////////
	
   	$('.tip_pop_comment_register').on('click','.CommentAddBtn',function() {
 		
		var value =$(".tip_pop_comment_register input").val();
		
		
		//alert(value);
		
	if(${loginUser.no==null}){
			alert("먼저 로그인 해주세요^.^");
			return false;
		}
		$('.tip_pop_only_comments').empty();	
		insertComment();
		comSelect();
		
			
	});
	
   	$(".tip_pop_comment_register input").on("keyup",function (e) {

		 if(e.keyCode==13) {
			// e.keyCode==0;
			 $('.tip_pop_only_comments').empty();	
				insertComment();
				comSelect();
		
		} 			
	});
	
	
	 function insertComment() {
		 
		$.ajax({
			url:"/ajax/comment/"+eq,
			dataType:"json",
			type:"POST",
			data:{contents:$(".tip_pop_comment_register input").val()},
			error:function() {
				alert("서버 점검중!");
			},
			success:function(json) {
				
			}
		})
		
	 }//end   
	////////////////////////////꿀팁상세 팝업 댓글삭제/////////////////////
	
	var comNo = -1;
	$('.tip_pop_contents_wrap').on('click','.tip_pop_comment_one',function() {
		comNo =$(this).data('num');
		
		//alert(comNo);
	});	 
	
  	$(".tip_pop_contents_wrap").on('click','.tip_pop_comment_one_delete',function(){
		
  		//alert("ㅎ");
  		 if(${loginUser.no==null}){
			alert("먼저 로그인 해주세요^.^");
			return false;
		}
  		deleteComment(); 
		$('.tip_pop_only_comments').empty();
		comSelect();
		
		
		
	}); 
	
	
 	function deleteComment() {
		 
		$.ajax({
			url:"/ajax/commentDel/"+comNo,
			dataType:"json",
			type:"DELETE",
			error:function() {
				alert("서버 점검중!");
			},
			success:function(json) {
				
			}
		}) 
		
	 }//end   
	 
	 ///////////////////////////////꿀팁상세 좋아요//////////////////////////////////////////
   
    	$(".tip_pop_like").on("click", function () {
    		
    		
    		
    		if(${loginUser == null}) {
    			alert("로그인 해주세요!");
    		} else {
    			// alert(talknum);
            	$.ajax({
            		url: "/ajax/honey/like",
            		dataType: "json",
            		type:"POST",
            		data: {"typeNo": eq},
            		error: function() {
        				alert("조ㅎ아요인서트에러");
        			},
            		success: function(json) {
            			
            			if($(".tip_pop_like i").hasClass('far')) {
            				$(".tip_pop_like i").removeClass('far').addClass('fas');
            	        }else{
            	        	$(".tip_pop_like i").removeClass('fas').addClass('far');
            	        	
            	        }
            			console.log(json);
            			$(".tip_pop_like strong").text(json.cnt);
        			}
            	});
    		}
        	
        });
	
	
	
	//////////////////////////////////////////////////////////////////
	
	
	///////////////////////////////꿀팁상세 스크랩///////////////////////
	$(".tip_pop_scrap").on("click", function () {
    		
		if(${loginUser == null}) {
			alert("로그인 해주세요!");
		} else {
    		
    		if(${loginUser == null}) {
    			alert("로그인 해주세요!");
    		} else {
    			// alert(talknum);
            	$.ajax({
            		url: "/ajax/honey/scrap",
            		dataType: "json",
            		type:"POST",
            		data: {"typeNo": eq},
            		error: function() {
        				alert("스크랩인서트에러");
        			},
            		success: function(json) {
            			
            			if($(".tip_pop_scrap i").hasClass('far')) {
            				$(".tip_pop_scrap i").removeClass('far').addClass('fas');
            			}else{
            				$(".tip_pop_scrap i").removeClass('fas').addClass('far');
            				
            			}
            			
            			$(".tip_pop_scrap em").text(json.scrapCnt);
        			}
            	});
    		}//if else end
    		
		}//if else end
        	
   });
	
	////////////////////////////////////////////////////////////////////

	$(".cancel_report .fa-times").click(function () {
		$("#tipPopBox").hide();
		$("#backPop").hide();
	});
	
	
	// 뒤 배경 누를 시 꺼짐
	$("#backPop").click(function () {
		$("#tipPopBox").hide();
		$("#backPop").hide();
	});


	$(".tip_pop_comment_one_delete").click(function () {
		alert("정말 삭제하시겠습니까?");
	});

	
    function go(){
        var gogoCount = $('.tip_pop_go').find('.tip_pop_go_one').length;
        
        console.log(gogoCount);
        for(var i=0;i <=gogoCount; i++){
            $('.tip_pop_go_one').eq(i).find('.count').text(i+1+" Go");
        }
    }//function end

   



	//////////////////////////////////////////////////////////
	
	////////꿀팁상세팝업/////
	$("#tipPopBox").hide();
	$("#backPop").hide(); 
	/////////////////////////
	
		
	
	////////////////
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