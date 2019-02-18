/****************header Script****************************/

_.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@(.+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };
    var $body = $("body");

    $(".setting").click(function () {
        //alert("test");
        $body.toggleClass("show");
    });

    $body.click(function (e) {
        //alert("test2");
        if($body.hasClass("show")){
            if(!$('.myInf, .setting').has(e.target).length){
                $body.removeClass("show");
            }
        }
    });

    $(" .header_box>.search").click(function () {
        $(".header_box>.search_box").fadeToggle();
        $(".header_box>.search i").toggleClass("fas fa-search").toggleClass("fas fa-times");
        $(".header_box>.search_box input").focus();
    });

  /*  $('#search_input').keydown(function (key) {
        if(key.keyCode == 13) {
            alert($(this).val());
        }
    });*/
    $(".login").click(function () {
        $("#loginPopup").show();
        $("#popup").show();
    });
    $("#loginClose").click(function () {
        $("#loginPopup").hide();
        $("#popup").hide();
    });

    $("#popup").click(function () {
        $("#loginPopup").hide();
        $("#popup").hide();
    });

    /*****************header Script end***************************/
    
    
    
    $(".join").click(function () {
        $("#registerPopup").show();
        $("#popup").show();
    });
    $("#registerClose").click(function () {
        $("#registerPopup").hide();
        $("#popup").hide();
    });

    $("#popup").click(function () {
        $("#registerPopup").hide();
        $("#popup").hide();
    });
    
    /****************************냉장고 스크립트**********************************/
    var atomTmp = _.template($("#atomContent").html());
    var iceAtomTmp = _.template($("#addMenu").html());
    var userNo = $('#mmmyyyNo').val()-0;
    
    // 냉장고 열기
    $(".refrigerator").click(function () {
    	if(userNo>=1){
    		loginUserGettIceBox(userNo);
    	}
    	getBaseAtom(1);
        $("#refPopup").show();
        $("#popup").show();
    });
    // 냉장고 닫기
    $("#refClose").click(function () {
        $("#refPopup").hide();
        $("#popup").hide();
    });
    // 냉장고 닫기
    $("#popup").click(function () {
        $("#refPopup").hide();
        $("#popup").hide();
    });

    // 냉장고 상단 바 위치 변경
    function materialBoxBtnSt(){
        var a =$('#material').css("left");
        a = a.substring(0, a.length-2)*1;
        if(a<5){
            $('#materialBox>.rightBtn').css("cursor", "not-allowed");
            $('#materialBox .leftBtn').css("cursor", "pointer");
        }else if(a>-725){
            $('#materialBox .leftBtn').css("cursor", "not-allowed");
            $('#materialBox>.rightBtn').css("cursor", "pointer");
        }
    }
    materialBoxBtnSt(); // 상단바 호출
    $("#materialBox .rightBtn").click(function () {
        $("#material").css("left", -725+'px');
        setTimeout(materialBoxBtnSt,510);
    }); // .leftBtn click() end

    $("#materialBox .leftBtn").click(function () {
        $("#material").css("left", 5+'px');
        setTimeout(materialBoxBtnSt,510);
    }); // .leftBtn click() end

    
    // 그냥 재료 불러오기
    function getBaseAtom(upNo){
    	$.ajax({
        	url:"/ajax/atom",
        	type:"get",
        	dataType:"json",
        	data:{upNo:upNo},
        	error:function(){
    			alert("서버 펑펑!");
    		},
    		success:function(json){
    			$('.field1').empty();
    			$('.field1').append(atomTmp({"data":json}));
    			setCheckAtom();
    		}
        });
    }
    
    //재료 체크하기
    function setCheckAtom(){
    	$('.field2 li').each(function(){
    		var f2No = $(this).find('em').data('atom');
    		$('.field1 li').each(function(){
    			if($(this).hasClass(f2No)){
    				$(this).addClass('selected');
    			}
    		});
    	});
    }
 
    
    
    $('#material li').click(function () {
        $('#material li').removeClass('on');
        $(this).addClass('on');
        //기본 (로그인 안됫을때)
        getBaseAtom($(this).data('upno'));
    });

    // 로그인유저 냉장고 아이템 추가
    function loginUserInsertIce(userNo, inNo){
    	$.ajax({
        	url:"/ajax/atom",
        	type:"post",
        	dataType:"text",
        	data:{"userNo":userNo, "inNo":inNo},
        	error:function(){
    			alert("서버 펑펑!");
    		},
    		success:function(){
    			
    		}
        });
    }
    // 로그인유저 냉장고 아이템 삭제
    function loginUserDeleteIce(userNo, inNo){
    	$.ajax({
        	url:"/ajax/atom/delete",
        	type:"post",
        	dataType:"text",
        	data:{"userNo":userNo, "inNo":inNo},
        	error:function(){
    			alert("서버 펑펑!");
    		},
    		success:function(){
    			
    		}
        });
    }
    // 로그인 유저 냉장고 불러오기
    function loginUserGettIceBox(userNo){
    	$.ajax({
        	url:"/ajax/atom/user",
        	type:"get",
        	dataType:"json",
        	data:{"userNo":userNo},
        	error:function(){
    			alert("서버 펑펑!");
    		},
    		success:function(json){
    			$('.field2 form ul').empty();
    			$(".field2 form ul").prepend(iceAtomTmp({data:json}));
    		}
        });
    }
    
    // 로그인 유저 냉장고 전체 삭제
    function loginUserDeleteAllIceBox(userNo){
    	$.ajax({
        	url:"/ajax/atom/delete/all",
        	type:"post",
        	dataType:"text",
        	data:{"userNo":userNo},
        	error:function(){
    			alert("서버 펑펑!");
    		},
    		success:function(){
    			
    		}
        });
    }
    // 냉장 고검색
    function iceSerch(){
    	$.ajax({
        	url:"/ajax/atom/serarch",
        	type:"post",
        	dataType:"json",
        	data:{"search":$('#iceSearch').val()},
        	error:function(){
    			alert("서버 펑펑!");
    		},
    		success:function(json){
    			$('.field1').empty();
    			$('#material li').removeClass('on');
    			$('.field1').append(atomTmp({"data":json}));
    			setCheckAtom();
    		}
        });
    }
    //냉장고 검색
    $('#iceSearch').keyup(function(e){
    	e.preventDefault();
    	if(e.keyCode == 13)
    		iceSerch();
	});
    
    
    
    // 냉장고에 추가 & 삭제
    $(".field1").on("click", "li", function () {
    	
    	var atomNo = $(this).data('atom');
    	var image = $(this).find('img').attr('src');
    	image = image.substring(5,image.length);
    	var atomName = $(this).find('strong').text();


        if ($(this).hasClass("selected")) {
            $(this).removeClass("selected");
            $(".field2 form ul").find("."+$(this).data('atom')).remove();
            if(userNo>=1){
            	loginUserDeleteIce(userNo, atomNo-0);
            }
            
        } else {
            $(this).addClass("selected");
            $(".field2 form ul").prepend(iceAtomTmp({data:[{"no":atomNo, "image":image, "name":atomName}]}));
            if(userNo>=1){
            	loginUserInsertIce(userNo, atomNo-0);
            }
        }
    });
    
    //  냉장고에서 삭제
    $('.field2').on("click","em",function () {
    	var atomNo = $(this).data('atom');
        $(this).parent().parent().remove();
        $('.field1').find('.'+$(this).data('atom')).removeClass('selected');
        if(userNo>=1){
        	loginUserDeleteIce(userNo, atomNo-0);
        }
    });
    // 냉장고 전체 삭제
    $('#removeBtn').click(function () {
        $('.field1 li').removeClass('selected');
        $('.field2 form ul').empty();
        if(userNo>=1){
        	loginUserDeleteAllIceBox(userNo);
        }
    });
    // 냉장고 체크
    $(".field2").on('click', 'li .check', function(){
        $(this).prev().prev().prev().prev().toggleClass('on');
    });
    $('')
    
    
    
    
    
    