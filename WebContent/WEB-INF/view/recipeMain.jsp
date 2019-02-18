<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>레시피 메인</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link rel="stylesheet" href="/css/recipeMain.css" />
<link rel="stylesheet" href="/css/jquery.tagsinput-revisited.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
</style>
</head>
<body>

	<c:import url="/WEB-INF/template/header.jsp"></c:import>


	<div id="background1080">


    <div id="categoryBox" class="show">

        <div class="categoryTitle">종류</div>
        <div class="category kinds">
            <input name="category" type="radio" id="c1" class="radio_button"><label for="c1" class="radio_label" data-value="">전체</label>
            <input name="category" type="radio" id="c2" class="radio_button"><label for="c2" class="radio_label" data-value="밑반찬">밑반찬</label>
            <input name="category" type="radio" id="c3" class="radio_button"><label for="c3" class="radio_label" data-value="메인반찬">메인반찬</label>
            <input name="category" type="radio" id="c4" class="radio_button"><label for="c4" class="radio_label" data-value="국/탕">국/탕</label>
            <input name="category" type="radio" id="c5" class="radio_button"><label for="c5" class="radio_label" data-value="찌개">찌개</label>
            <input name="category" type="radio" id="c6" class="radio_button"><label for="c6" class="radio_label" data-value="디저트">디저트</label>
            <input name="category" type="radio" id="c7" class="radio_button"><label for="c7" class="radio_label" data-value="면/만두">면/만두</label>
            <input name="category" type="radio" id="c8" class="radio_button"><label for="c8" class="radio_label" data-value="밥/죽/떡">밥/죽/떡</label>
            <input name="category" type="radio" id="c9" class="radio_button"><label for="c9" class="radio_label" data-value="퓨전">퓨전</label>
            <input name="category" type="radio" id="c10" class="radio_button"><label for="c10" class="radio_label" data-value="김치/젓갈/장류">김치/젓갈/장</label>
            <input name="category" type="radio" id="c11" class="radio_button"><label for="c11" class="radio_label" data-value="양념/소스/잼">양념/소스/잼</label>
            <input name="category" type="radio" id="c12" class="radio_button"><label for="c12" class="radio_label" data-value="양식">양식</label>
            <input name="category" type="radio" id="c13" class="radio_button"><label for="c13" class="radio_label" data-value="샐러드">샐러드</label>
            <input name="category" type="radio" id="c14" class="radio_button"><label for="c14" class="radio_label" data-value="스프">스프</label>
            <input name="category" type="radio" id="c15" class="radio_button"><label for="c15" class="radio_label" data-value="빵">빵</label>
            <input name="category" type="radio" id="c16" class="radio_button"><label for="c16" class="radio_label" data-value="과자">과자</label>
            <input name="category" type="radio" id="c17" class="radio_button"><label for="c17" class="radio_label" data-value="차/음료/술">차/음료/술</label>
            <input name="category" type="radio" id="c18" class="radio_button"><label for="c18" class="radio_label" data-value="기타">기타</label>
        </div>
        

        <div class="categoryTitle">상황</div>
        <div class="category situation">
            <input name="situation" type="radio" id="s1" class="radio_button"><label for="s1" class="radio_label" data-value="">전체</label>
            <input name="situation" type="radio" id="s2" class="radio_button"><label for="s2" class="radio_label" data-value="일상">일상</label>
            <input name="situation" type="radio" id="s3" class="radio_button"><label for="s3" class="radio_label" data-value="초스피드">초스피드</label>
            <input name="situation" type="radio" id="s4" class="radio_button"><label for="s4" class="radio_label" data-value="손님접대">손님접대</label>
            <input name="situation" type="radio" id="s5" class="radio_button"><label for="s5" class="radio_label" data-value="술안주">술안주</label>
            <input name="situation" type="radio" id="s6" class="radio_button"><label for="s6" class="radio_label" data-value="다이어트">다이어트</label>
            <input name="situation" type="radio" id="s7" class="radio_button"><label for="s7" class="radio_label" data-value="도시락">도시락</label>
            <input name="situation" type="radio" id="s8" class="radio_button"><label for="s8" class="radio_label" data-value="영양식">영양식</label>
            <input name="situation" type="radio" id="s9" class="radio_button"><label for="s9" class="radio_label" data-value="간식">간식</label>
            <input name="situation" type="radio" id="s10" class="radio_button"><label for="s10" class="radio_label" data-value="야식">야식</label>
            <input name="situation" type="radio" id="s11" class="radio_button"><label for="s11" class="radio_label" data-value="푸드스타일링">푸드스타일링</label>
            <input name="situation" type="radio" id="s12" class="radio_button"><label for="s12" class="radio_label" data-value="해장">해장</label>
            <input name="situation" type="radio" id="s13" class="radio_button"><label for="s13" class="radio_label" data-value="명절">명절</label>
            <input name="situation" type="radio" id="s14" class="radio_button"><label for="s14" class="radio_label" data-value="이유식">이유식</label>
            <input name="situation" type="radio" id="s15" class="radio_button"><label for="s15" class="radio_label" data-value="기타">기타</label>
        </div>


        <div class="categoryTitle">방법</div>
        <div class="category section">
            <input name="make" type="radio" id="m1" class="radio_button"><label for="m1" class="radio_label" data-value="">전체</label>
            <input name="make" type="radio" id="m2" class="radio_button"><label for="m2" class="radio_label" data-value="볶음">볶음</label>
            <input name="make" type="radio" id="m3" class="radio_button"><label for="m3" class="radio_label" data-value="끓이기">끓이기</label>
            <input name="make" type="radio" id="m4" class="radio_button"><label for="m4" class="radio_label" data-value="부침">부침</label>
            <input name="make" type="radio" id="m5" class="radio_button"><label for="m5" class="radio_label" data-value="조림">조림</label>
            <input name="make" type="radio" id="m6" class="radio_button"><label for="m6" class="radio_label" data-value="무침">무침</label>
            <input name="make" type="radio" id="m7" class="radio_button"><label for="m7" class="radio_label" data-value="비빔">비빔</label>
            <input name="make" type="radio" id="m8" class="radio_button"><label for="m8" class="radio_label" data-value="찜">찜</label>
            <input name="make" type="radio" id="m9" class="radio_button"><label for="m9" class="radio_label" data-value="절임">절임</label>
            <input name="make" type="radio" id="m10" class="radio_button"><label for="m10" class="radio_label" data-value="튀김">튀김</label>
            <input name="make" type="radio" id="m11" class="radio_button"><label for="m11" class="radio_label" data-value="삶기">삶기</label>
            <input name="make" type="radio" id="m12" class="radio_button"><label for="m12" class="radio_label" data-value="굽기">굽기</label>
            <input name="make" type="radio" id="m13" class="radio_button"><label for="m13" class="radio_label" data-value="데치기">데치기</label>
            <input name="make" type="radio" id="m14" class="radio_button"><label for="m14" class="radio_label" data-value="회">회</label>
            <input name="make" type="radio" id="m15" class="radio_button"><label for="m15" class="radio_label" data-value="기타">기타</label>
        </div>


		<div class="categoryTitle">재료</div>
        <div class="category ingredient">
           	<input name="item" type="radio" id="i1" class="radio_button"><label for="i1" class="radio_label" data-value="">전체</label>
            <input name="item" type="radio" id="i2" class="radio_button"><label for="i2" class="radio_label" data-value="곡류">곡류</label>
            <input name="item" type="radio" id="i3" class="radio_button"><label for="i3" class="radio_label" data-value="면/만두류">면/만두</label>
            <input name="item" type="radio" id="i4" class="radio_button"><label for="i4" class="radio_label" data-value="빵류">빵</label>
            <input name="item" type="radio" id="i5" class="radio_button"><label for="i5" class="radio_label" data-value="과자류">과자</label>
            <input name="item" type="radio" id="i6" class="radio_button"><label for="i6" class="radio_label" data-value="떡류">떡</label>
            <input name="item" type="radio" id="i7" class="radio_button"><label for="i7" class="radio_label" data-value="감자/고구마류">감자/고구마</label>
            <input name="item" type="radio" id="i8" class="radio_button"><label for="i8" class="radio_label" data-value="묵/두부">묵/두부</label>
            <input name="item" type="radio" id="i9" class="radio_button"><label for="i9" class="radio_label" data-value="콩/견과류">콩/견과류</label>
            <input name="item" type="radio" id="i10" class="radio_button"><label for="i10" class="radio_label" data-value="채소류">채소</label>
            <input name="item" type="radio" id="i11" class="radio_button"><label for="i11" class="radio_label" data-value="과일류">과일</label>
            <input name="item" type="radio" id="i12" class="radio_button"><label for="i12" class="radio_label" data-value="고기류">고기</label>
            <input name="item" type="radio" id="i13" class="radio_button"><label for="i13" class="radio_label" data-value="햄/소시지">햄/소시지</label>
            <input name="item" type="radio" id="i14" class="radio_button"><label for="i14" class="radio_label" data-value="계란류">계란</label>
            <input name="item" type="radio" id="i15" class="radio_button"><label for="i15" class="radio_label" data-value="어패류">어패류</label>
            <input name="item" type="radio" id="i16" class="radio_button"><label for="i16" class="radio_label" data-value="해조류">해조류</label>
            <input name="item" type="radio" id="i17" class="radio_button"><label for="i17" class="radio_label" data-value="유제품/치즈류">유제품/치즈</label>
            <input name="item" type="radio" id="i18" class="radio_button"><label for="i18" class="radio_label" data-value="양념류">양념</label>
            <input name="item" type="radio" id="i19" class="radio_button"><label for="i19" class="radio_label" data-value="초콜렛/사탕">초콜렛/사탕</label>
            <input name="item" type="radio" id="i20" class="radio_button"><label for="i20" class="radio_label" data-value="음료/주류">음료/주류</label>
        </div>
        
        
        <div class="categoryTitle">인원</div>
        <div class="category person">
            <input name="person" type="radio" id="p1" class="radio_button"><label for="p1" class="radio_label" data-value="1">1인분</label>
            <input name="person" type="radio" id="p2" class="radio_button"><label for="p2" class="radio_label" data-value="2">2인분</label>
            <input name="person" type="radio" id="p3" class="radio_button"><label for="p3" class="radio_label" data-value="3">3인분</label>
            <input name="person" type="radio" id="p4" class="radio_button"><label for="p4" class="radio_label" data-value="4">4인분</label>
            <input name="person" type="radio" id="p5" class="radio_button"><label for="p5" class="radio_label" data-value="5">5인분</label>
            <input name="person" type="radio" id="p6" class="radio_button"><label for="p6" class="radio_label" data-value="6">6인분 이상</label>
        </div>

        <div class="categoryTitle">시간</div>
        <div class="category timer">
            <input name="time" type="radio" id="t1" class="radio_button"><label for="t1" class="radio_label" data-value="5">5분 이내</label>
            <input name="time" type="radio" id="t2" class="radio_button"><label for="t2" class="radio_label" data-value="10">10분 이내</label>
            <input name="time" type="radio" id="t3" class="radio_button"><label for="t3" class="radio_label" data-value="15">15분 이내</label>
            <input name="time" type="radio" id="t4" class="radio_button"><label for="t4" class="radio_label" data-value="20">20분 이내</label>
            <input name="time" type="radio" id="t5" class="radio_button"><label for="t5" class="radio_label" data-value="30">30분 이내</label>
            <input name="time" type="radio" id="t6" class="radio_button"><label for="t6" class="radio_label" data-value="60">60분 이내</label>
            <input name="time" type="radio" id="t7" class="radio_button"><label for="t7" class="radio_label" data-value="90">90분 이내</label>
            <input name="time" type="radio" id="t8" class="radio_button"><label for="t8" class="radio_label" data-value="120">2시간 이내</label>
            <input name="time" type="radio" id="t9" class="radio_button"><label for="t9" class="radio_label" data-value="121">2시간 이상</label>
        </div>

        <div class="categoryTitle">난이도</div>
        <div class="category step">
            <input name="level" type="radio" id="l1" class="radio_button"><label for="l1" class="radio_label" data-value="아무나">아무나</label>
            <input name="level" type="radio" id="l2" class="radio_button"><label for="l2" class="radio_label" data-value="초급">초급</label>
            <input name="level" type="radio" id="l3" class="radio_button"><label for="l3" class="radio_label" data-value="중급">중급</label>
            <input name="level" type="radio" id="l4" class="radio_button"><label for="l4" class="radio_label" data-value="고급">고급</label>
            <input name="level" type="radio" id="l5" class="radio_button"><label for="l5" class="radio_label" data-value="5성급">5성급 쉐프</label>
        </div>

        <div>
            <button id="loadRef" type="button">냉장고 불러오기</button>
        </div>

        <div id="refDiv">

            <input id="tag" name="ref" type="text" value="">
            <button id="clearButton">초기화</button>
        </div>



    </div>
    <button id="closeButton">필터 닫기</button>

    <div id="contentsList">	

        <div id="orderBox" class="order">
            <input name="order" type="radio" id="new" class="radio_order_button" checked><label for="new" class="radio_label order_label" data-value="regdate">최신순</label>
            <input name="order" type="radio" id="best" class="radio_order_button"><label for="best" class="radio_label order_label" data-value="countNo">인기순</label>
        </div>

        <div id="listView">

            <script type="text/template" id="listTmpl">
			<@_.each(listTmpl, function(data){@>
                <div class="listBox" data-no="<@=data.no@>">
					<@if(data.num!=0){@>
					<div class="circle"><@=data.num@><div class="circle_info">냉장고 재료 갯수</div></div>
					<@ } @>
                    <div class="picBox">
                        <img class="pic" src="<@=data.pic@>"/>
                    </div>
                    <div class="profilePicBox">
                        <img class="pro_pic" src="<@=data.profile@>"/>
                    </div>
                    <div class="infoBox">
                        <div class="name"><@=data.nickname@></div>
                        <div class="title"><@=data.title@></div>
                    </div>
                    <div class="infoBox2">
                        <div class="time"><@if(data.time==120){@>2시간이내<@}else if(data.time==121){@>2시간 이상<@}else{@><@=data.time@>분<@}@></div>
                        <div class="easy"><@=data.step@></div>
                        <div class="heart"><i class="fas fa-heart"></i> <@=data.countNo@></div>
                    </div>

                </div>
			<@})@>
            </script>

        </div>

            <button id="moreViewButton">더 보기</button>


    </div>



</div>




	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
	<script src="/js/jquery.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script src="/js/fix-footer.js"></script>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT"
		crossorigin="anonymous"></script>
	<script src="/js/jquery.tagsinput-revisited.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
		integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
		crossorigin="anonymous"></script>
		<script src="/js/header.js"></script>
	<script>
	$('.header_box>.recipe').addClass('on'); // header  tab on 


	 ///////////////////////////////////////

    var nums = "${param.nums}";
    var text = "${param.text}";
    //var nums = "20";
    //var text = "귀리";
    var kinds = null;
	var situation = null;
	var section = null; 
	var ingredient = null;
	var person = null;
	var time = null;
	var step = null;
	var order = 'regdate';
	var pageNo = 1;
	var search = "'%${param.search}%'";
		
	
	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@([\s\S]+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
	};
	
	
    var tmp = _.template($("#listTmpl").html());

    
    //ajax
    function filter(a){
    	
    	console.log(pageNo);
   
    	$.ajax({
    		url:"/ajax/recipe/filter",
    		type:"GET",
    		dataType:"json",
    		data:{
    			"search":search,
    			"start": pageNo,
    			"kinds": kinds,
    			 "situation" : situation,
    			 "section" : section,
    			 "ingredient" : ingredient,
    			 "person" : person,
    			 "time" : time,
    			 "step" : step,
    			 "order" : order,
    			 "nums" : nums,
    			 "text" : text
    		},
    		error:function(jqXHR, textStatus, errorThrown){
 	            alert("에러 발생~~ ");
 	        },
 	        success:function(json){
 	        	
 	        	console.log(json);
 	        	console.log(search);
 	        	console.log(nums);
 	        	
 	        	if(a==1){
 	        		$("#listView").append(tmp({listTmpl:json}));
 	        	}else{
 	        		$("#listView").html(tmp({listTmpl:json}));
 	        	}
 	      
 	
 	        }//sueccess end
    	});//$.ajax() end
    }//filter();
    
    filter(0);
    
    $("#moreViewButton").click(function () {
    	pageNo++;
    	filter(1);
		       
    });
    
       
    $(".radio_label").click(function(){
    	
    	var value = this.dataset.value;
    	
    	
    	if($(this).parent().hasClass('kinds')){
    		kinds = value;
    	}else if($(this).parent().hasClass('situation')){
    		situation = value;
    	}else if($(this).parent().hasClass('section')){
    		section = value;
    	}else if($(this).parent().hasClass('ingredient')){
    		ingredient = value;
    	}else if($(this).parent().hasClass('person')){
    		person = value;
    	}else if($(this).parent().hasClass('timer')){
    		time = value;
    	}else if($(this).parent().hasClass('step')){
    		step = value;
    	}else if($(this).parent().hasClass('order')){
    		order = value;
    	}
    	    	
    	pageNo=1;
    	
    	filter(0);
    });
       
    
    //필터 여닫기
    $("#closeButton").click(function () {
        // $("#categoryBox").slideToggle("slow", function () {
           if($("#categoryBox").hasClass("show")) {
               $("#categoryBox").slideUp();
               $("#closeButton").text("필터 열기");
               $("#categoryBox").removeClass("show");
           } else {
               $("#categoryBox").slideDown();
               $("#closeButton").text("필터 닫기");
               $("#categoryBox").addClass("show");
               $("#closeButton").css("color", "white");
           }
        // });

    });

  

    $("#listView").on("click",".listBox",function(){
    	location.href="/recipe/"+$(this).data("no");
    });

    //tagsInput은 jquery.tagsinput-revisited.js 를 수정해야 함.
    //여러개의 태그는 ,로 구분되어 한개의 파라미터(tag)로 넘어감
        
    $('#tag').tagsInput({

        // min/max number of characters
        minChars: 0,
        maxChars: null,

        // max number of tags
        limit: null,

        // RegExp
        validationPattern: null,

        // duplicate validation
        unique: false,
        
        
        interactive: false,
        

        placeholder: "냉장고 속 재료를 선택해주세요!",
        width: "1060px",
        height: "auto",

    });


    //초기화 클릭. 클릭시 냉장고에서 선택한 재료 및 선택한 필터 전부 초기화
    $("#clearButton").click(function () {

        //냉장고 선택 재료 초기화
       $("#tag_tagsinput").find("span").remove();
       //넘어가는 값 초기화
       $("#tag").attr("value", "");
       //체크한 라디오 버튼 초기화
       $(".radio_button").prop('checked', false);
       
       search = null;
       kinds = null;
   	   situation = null;
   	   section = null; 
   	   ingredient = null;
   	   person = null;
   	   time = null;
   	   step = null;
   	   order = 'regdate';
   	   text='';
   	   nums='';
   	   pageNo = 1;
   	   filter(0);
   	   
   	 $(".header_box>.search_box input").attr("placeholder",'');
    });
   
    
     if(search.length!=4){
        $(".header_box>.search_box").fadeToggle();
        $(".header_box>.search i").toggleClass("fas fa-search").toggleClass("fas fa-times");
        $(".header_box>.search_box input").attr("placeholder",search.substring(2,search.length-2));
       
    } 
    
     $('#tag_tagsinput').on('click', '.tag-remove', function(){
    	 $(this).parent().parent().remove();
    		var text1 = "";
	    	var nums1 = "";
    	 $('.tag-text').each(function(){
    		 text1 = text1+$(this).text()+",";
    		 nums1 = nums1+$(this).data('num')+",";
    	 });
    	 nums1 = nums1.substring(0, nums1.length-1);
    	 $('#tag').attr("value",text1);
    	 text = text1+"'";
		 nums = nums1;
    	 filter(0);
     });

		$('#lastForm').submit(function(){
		       return false;
		    });
		    
		    $('#goBtn').click(function(e){
		    	var text1 = "";
		    	var nums1 = "";
		    	$('#tag_tagsinput').empty();
		       $('.no_checked.on').each(function(){
		    	   $('#tag_tagsinput').prepend($("<span class='tag'><span data-num="+$(this).next().next().next().next().next().val()+"  class='tag-text'>"+$(this).next().next().next().next().val()+"<button class='tag-remove'></button></span></span>"));
		    	   
		    	   text1 = text1+$(this).next().next().next().next().val() + ","
		    	   nums1 = nums1 + $(this).next().next().next().next().next().val() + ",";
		       });
		       	nums1 = nums1.substring(0, nums1.length-1);
			    $('#tag').attr("value",text1);
			    //alert(nums1);
			    text = text1+"'";
			    nums = nums1;
			    $("#refPopup").hide();
			    $("#popup").hide();
			    filter(0);
		    });
			
		    function aa(e){
		    	//alert('${param.text}'+'${param.nums}');
		    	var text = '${param.text}';
		    	var nums = '${param.nums}';
		       $('.no_checked.on').each(function(){
		    	   $('#tag_tagsinput').prepend($("<span class='tag'><span data-num="+$(this).next().next().next().next().next().val()+"  class='tag-text'>"+$(this).next().next().next().next().val()+"<button class='tag-remove'></button></span></span>"));
		    	   
		    	   text = text+$(this).next().next().next().next().val() + ","
		    	   nums = nums + $(this).next().next().next().next().next().val() + ",";
		       });
		       	nums = nums.substring(0, nums.length-1);
			    $('#tag').attr("value",text);
			    //alert(nums);
			    $("#refPopup").hide();
			    $("#popup").hide();
			    
		    }
		    aa();
		    
		    
		
	    $("#loadRef").click(function () {
	    	if(userNo>=1){
	    		loginUserGettIceBox(userNo);
	    	}
	    	getBaseAtom(1);
	        $("#refPopup").show();
	        $("#popup").show();
	    });
	    
	    
	    <c:if test="${param.text.length()>0}">
	    	var arryText = "${param.text}".split(',');
	    	var arryNums = "${param.nums}".split(',');
	    	for(var z=0 ; z< arryText.length; z++){
	    		$('#tag_tagsinput').prepend($("<span class='tag'><span data-num="+arryNums[z]+"  class='tag-text'>"+arryText[z]+"<button class='tag-remove'></button></span></span>"));
	    	}
    	</c:if>
    

</script>



</body>
</html>