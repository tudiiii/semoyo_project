<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>꿀팁 등록</title>
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/addTip.css"/>
</head>

<!--  혁진추가 >>


.gogo li:nth-child(3) i {

    position: relative; ->position: absolute; 
    
 .gogo li:nth-child(3) img {
   
   z-index:4
   
   추가
   
  -->


<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>

<form action="/addTip" method="POST" id="addTip">
    <div id="tipWrap">
        <ul class="tips">
            <li class="on">손질꿀팁</li>
            <li>저장꿀팁</li>
            <li>조합꿀팁</li>
            <li>기타꿀팁</li>
        </ul>
        <input type="hidden" name ="type" id="aaaa" value="손질"/>
        
        <div class="tipTitle"><div class="title" placeholder="팁을 적어주세요^^">제목</div><input type="text" name="title" placeholder="제목을 입력하세요."></div>
        <div class="tipContents"><div class="contents">내용</div><textarea style="resize:none;" name="content" placeholder="내용을 입력하세요."></textarea></div>
        <div class="goBox">
        <div class="order"><i class="fab fa-forumbee"></i>  꿀팁 순서</div>
            <!-- <ul class="gogo">
             <li class="count">1 Go</li>
                <li><textarea style="resize: none" name="contents" placeholder="팁을 적어주세요^^"></textarea></li>
                <li><input type="hidden" class="profileNameTip" name="pic" />
	<div class="profileBoxTip" class="no_image"><img width="200" height="200" class="profileImgTip"  />
	<label ><i class="fas fa-plus"></i><input type="file" class="profileTip"></label></div>
	<div class="msg profileTip"></div> </li>
                <li><i class="fas fa-angle-up"></i><i class="fas fa-times"></i><i class="fas fa-angle-down"></i></li> 
            </ul> -->
        </div>
        <button class="addbtn" type="button">추가하기</button>
        <div class="allbtn">
        <a href="tipmain"><button class="cancelbtn" type="button">취소</button></a>
        <button class="enterbtn">등록</button>
        </div>
    </div>
 </form>
    
<c:import url="/WEB-INF/template/footer.jsp"></c:import>

    <script type="text/template" id="goTmp">
        <ul class="gogo">
            <li class="count">1 Go</li>
            <li><textarea style="resize: none" name="contents" placeholder="예) 국물 떡볶이는 고추장을 넣고 끓는 물을 선까지 붓고 전자렌지에 3분30초 돌린다. "></textarea></li>
            <li>
    <label><i class="fas fa-plus"></i><input type="file" class="profileTip">
	<input type="hidden" class="profileNameTip" name="pic" />
	<div class="profileBoxTip" class="no_image">
		<img width="200" height="200" class="profileImgTip"/>
	</label>
	</div>
	<div class="msg profileTip"></div> 
			</li>
                <li><i class="fas fa-angle-up"></i><i class="fas fa-times"></i><i class="fas fa-angle-down"></i></li>
        </ul>
    </script>
    <script src="/js/jquery.js"></script>
    <script src="/js/underscore-min.js"></script>
    <script src="/js/fix-footer.js"></script>
    <script src="/js/header.js"></script>
    <script>
    
    
  //image인지 확인하는 정규표현식
    var profileReg = /^image/;
  //유저가 이전에 입력한 값(ajax경우 중복 요청을 막기 위해서)
    var oldProfile = null;
    
  //profile input요소(type file)
    
    //profile msg 
    var $profileMsg = $(".msg.profileTip");
  
    //profileBox
    var $profileBox = $(".profileBoxTip");
   

    function checkProfile() {
    	
    	var $profileTip = $(this);
    	
    	 //profileName
        var $profileName = $profileTip.parents(".gogo").find(".profileNameTip");
        //profileImg
        var $profileImg = $profileTip.parents(".gogo").find(".profileImgTip");
    	
    	//jquery객체에서 순수자바스크립트요소객체 얻기
    	var profile = $profileTip.get(0);
    	
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

    			$profileName.val(json.src);
    			$profileImg.attr("src",json.src);
    			//$profileBox.removeClass("no_image");
    			$profileTip.val("");
    			$(".profileImgTip").css({"display":"block"});
    			/* $(".fas.fa-plus").css("opacity","0"); */
				
    			
    		}//success end
    		
    	});//ajax() end
    	
    	}//if end
    	
    }//checkProfile() end

    $(".goBox").on('change',".profileTip",checkProfile);
    
    $("#addTip").submit(function() {
    	
    	checkProfile();
    	
    	if( 	
    			$profileBox.hasClass("no_image")
    			   ) {
    				//console.log("서브밋 안됨");
    				return false;
    			}//if end
    });
    
    
    /* $(".delete").click(function() {
    
    	$profileBox.addClass("no_image");
    }); */
    
///////////////////////////
        $(".tips li").click(function () {
            $(".on").removeClass("on");
            $(this).addClass("on");
            if($(this).text() == '저장꿀팁'){
            	$('#aaaa').val('저장');	
            }
            if($(this).text() == '조합꿀팁'){
            	$('#aaaa').val('조합');	
            }
            if($(this).text() == '기타꿀팁'){
            	$('#aaaa').val('기타');	
            }
            if($(this).text() == '손질꿀팁'){
            	$('#aaaa').val('손질');	
            }
            
        });

   		 ////////////////
        function go(){
            var gogoCount = $('.goBox').find('.gogo').length;
            for(var i=0;i <=gogoCount; i++){
                $('.gogo').eq(i).find('.count').text(i+1+" Go");
            }
        }//function end
        /////////////////////
      
        

        //순서이동
        $(".goBox").on("click",".fa-angle-up",function () {
            var srcDiv = $(this).parents(".gogo");
            var tgtDiv = srcDiv.prev();
            if (tgtDiv[0]) {
                tgtDiv.before(srcDiv);
            }
            var order = getOrder(".gogo", $(".goBox")[0]);
            console.log(order);
            go();
        });

        $(".goBox").on("click", ".fa-angle-down",function () {
            var srcDiv = $(this).parents(".gogo");
            var tgtDiv = srcDiv.next();
            if (tgtDiv[0]) {
                tgtDiv.after(srcDiv);
            }
            var order = getOrder(".gogo", $(".goBox")[0]);
            console.log(order);
            go();
        });

        function getOrder(selector, container) {
            var order = [];
            $(selector, container).each(function () {
                order.push(this.id);
            });
            return order;
        }
     //////순서이동 end//////////////

	////추가하기 누를시 생성////////
        var gogoTmp = _.template($('#goTmp').html());

        var n = 1;
        var eq = $(this).index()
       
        //go 처음 호출 
        $('.goBox').append(gogoTmp());
        
        $(".addbtn").click(function () {
            n += 1;
         
            $('.goBox').append(gogoTmp());
            $('.gogo li:nth-child(1)').eq(eq).text(n+" Go")
        });
        
        
    
        
        /////gogo삭제//////////////////////////
        $(".goBox").on("click",".fa-times",function () {  

            if(confirm("삭제 하시겠습니까?")==true){
            	n -= 1;
           
                $(this).parent().parent().remove();
                $('.gogo li:nth-child(1)').text(n+" Go")
                go();
            }else {
                return false;
            } 
    
		  });
        /////////////////////////////////
        
        
		////////////등록//////////////

        $(".enterbtn").click(function () {
			
            if(confirm("등록 하시겠습니까?")==true){
                document.form.submit();
            }else {
                return false;
            }
        });

        $(".cancelbtn").click(function () {

            if(confirm("나가시겠습니까?")==true){
                document.form.submit();
            }else {
                return false;
            }
        });
        
        /////////////////////////////////
        
        
        ///////////이미지 삭제시/////////////
        
        $(".goBox").on('click','.profileImgTip',function () {
        	
            var img = $(this).attr("src");

            if(img){
            
                if(confirm("삭제 하시겠습니까?")==true){
                	
                $(".profileNameTip").val("");
                $(this).val("");
                $(this).attr("src","");
                /* $(".fas.fa-plus").css("opacity","1"); */
                    
               
                    //$('.gogo li:nth-child(3)').append('<label><i class="fas fa-plus"></i><input type="file"></label>'); 
                }else {
                    return false;
                }
            }
        })//end
        
  
        ////////////////////
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