<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>나눔후기등록 페이지</title>
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/tui-date-picker.css">
    <link rel="stylesheet" href="/css/tui-time-picker.css"/>
    <link rel="stylesheet" href="/css/reviewRegister.css"/>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"/>
	
<h1>나눔 후기 작성   <i class="far fa-edit"></i></h1>
<div id="aux">
    <form action="/review/register" method="post" id=reviewFormBox>
    <input type="hidden" name="_method" value="PUT"/>
    <input type="hidden" name="no" value="${no }"/>
    <input type="hidden" name="giveNo" value="${giveOne.giveNo }"/>
    <input type="hidden" name="title" value="${giveOne.nickname}의 ( ${giveOne.gift } ) 나눔 당첨 후기">
    <div id="title">${giveOne.nickname}의 '${giveOne.title }'  ( ${giveOne.gift } ) 나눔 당첨 후기</div>
    <textarea name="content" placeholder="나눔 당첨 후기를 입력해주세요."></textarea>
    <div id="pictureBox">
			<div id="addPicture">
				<label for="addPictureButton">+</label>
				<input id="addPictureButton" type="file" accept="image/*" class="talk_img"/>
			</div>

            <script type="text/template" id="talkImgTmp">
				<div class="talk_pic">
                    <img class="pic" src="<@=src@>"/>
                    <button type="button" class="delete_button"><i class="fas fa-trash-alt"></i></button>
					<input type="hidden" name="pic" value="<@=src@>" class="talk_img_name">
                </div>
			</script>
			
		</div>
		<div id="tutorialPicture"><i class="fas fa-exclamation-triangle"></i> 사진은 최대 5장까지 등록 할 수 있습니다.</div>
		<div id="buttonBox">
			<button type="button" class="form_button" id="cancleButton">취소</button>
			<button type="submit" class="form_button" id="submitButton">등록</button>
		</div>
		<input type="hidden" name="userCheck" value="1"/>
    </form>

</div><!--aux-->
<c:import url="/WEB-INF/template/footer.jsp"/>

<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/fix-footer.js"></script>
<script src="/js/header.js"></script>
<script>

var talkImgTmp = _.template($("#talkImgTmp").html());

var $talkImg = $(".talk_img");
var imgReg = /^image/;
var oldImg = null;

function checkImg() {
	
	
	var eventImg = $(this).get(0);
	
	var file1 = eventImg.files[0];
	
	console.log(file1);
	
	if(file1 == null || file1.size <= 0) {
		alert("제대로 된 파일을 넣어주세요!");
		return;
	}
	
	if(!imgReg.test(file1.type)) {
		alert("이미지 파일을 선택해주세요!");
		return;
	}
	
	
	if(oldImg != file1.name) {
		oldImg = file1.name;
		
		var form = new FormData();
		
		form.append("uploadImg", file1, file1.name);
		
		var $this = $(this);
		
		var $imgBox = $this.parent("#addPictureButton").next(".talk_pic");
		
		var $event_img_main = $imgBox.find(".pic");
		
		var $img_name = $imgBox.find(".talk_img_name");
		
		$.ajax({
			url: "/ajax/upload",
			dataType: "json",
			type: "POST",
			processData: false,
			contentType: false,
			data: form,
			error: function() {
				alert("에러!");
			}, 
			success: function(json) {
				
				$("#pictureBox").append(talkImgTmp({src:json.src}));
				$event_img_main.attr("src", "/upload/" + file1.name);
				$img_name.val(file1.name);
			
			}
			
		});
		
	}
	
}


$("#addPictureButton").change(checkImg);

//사진 삭제
$("body").on("click", ".delete_button", function () {

	$(this).parent().remove();

});

//취소버튼 클릭시 다시 한번 물어봄
$("#cancleButton").click(function () {
	var flag = confirm("정말 작성을 취소하시겠습니까?");

	if(flag) {
		location.href = "/give";
	}
});

$('#submitButton').click(function () {
	
});
$('#reviewFormBox').submit(function(){
	if($(this).find('.talk_img_name').length ==0){
		alert('사진을 한장 이상 등록해주세요');
		return false;
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
fixFooter();

</script>
</body>
</html>