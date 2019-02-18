<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>소통 등록</title>
	<c:import url="/WEB-INF/template/link.jsp"></c:import>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/css/jquery.tagsinput-revisited.css">
	<link rel="stylesheet" href="/css/talkInsert.css">

</head>
<body>

<c:import url="/WEB-INF/template/header.jsp"></c:import>


<div id="background1080">
	<div id="title">
		<i class="fas fa-pencil-alt"></i>소통 등록
	</div>
	<div id="tutorial">
		소소한 일상, 요리 이야기 등 자유로운 이야기를 나누세요.
	</div>
	
	<form id="talkForm" action="/talk/insert" method="POST">
		<div id="contentBox">
			<div id="contentTitle">내용</div>
			<div id="content">
				<textarea id="contentTextarea" name="contents" placeholder="내용을 입력해주세요."></textarea>
			</div>
		</div>

		<div id="tagBox">
			<div id="tagTitle">태그</div>
			<div id="tagSpace">

				<input id="tag" name="name" type="text" value="">

			</div>
		</div>

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

	</form>


</div>



<c:import url="/WEB-INF/template/footer.jsp"></c:import>


<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT" crossorigin="anonymous"></script>
<script src="/js/jquery.tagsinput-revisited.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
<script src="/js/fix-footer.js"></script>
<script src="/js/header.js"></script>
<script>


	/////////////////////////////////////////////////////////////////////


	$('.header_box>.commu').addClass('on');
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
        unique: true

    });
	
	var talkImgTmp = _.template($("#talkImgTmp").html());
	
	// 은서 : 사진 등록
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
			location.href = "/talk";
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

</body>
</html>