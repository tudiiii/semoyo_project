<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>레시피 등록</title>
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/jquery.tagsinput-revisiteds.css">
	<link rel="stylesheet" href="/css/recipeRegister.css">
	
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>
<body>

<c:import url="/WEB-INF/template/header.jsp"/>
<!---------------------------------------------content----------------------------------------------------->

<div class="insertRecipeWrap">
    <form action="/insertRecipe" method="post" id="recipeForm" onsubmit="return formSubmit();">
        <fieldset>
            <div id="insert"><i class="fas fa-pencil-alt"> 레시피 등록</i></div>
            <div id="storyTelling">함께 나누고 싶은 요리 이야기를 작성해주세요.</div>

            <!-- 정보 -->
            <div class="contentBox recipe">
                <div class="contentWrap">
                    <div class="info">
                        <span class="content_title">레시피 제목</span>
                        <input name="title" placeholder="예) 소고기 미역국 끓이기" autocomplete="off" required/>
                    </div>
                    <div class="info">
                        <span class="content_title">요리 이름</span>
                        <input name="name" placeholder="만드실 요리 이름을 적어주세요. 이름으로 검색을 합니다." required/>
                    </div>
                    <div class="intro info">
                        <span class="content_title">요리 소개</span>
                        <textarea name="content" placeholder="이 요리의 탄생 배경을 적어주세요." required></textarea>
                    </div>
                    <div class="info">
                        <span class="content_title">동영상</span>
                        <input name="video" placeholder="동영상이 있으면 주소를 입력하세요.(Youtube만 가능)"/></div>
                    <div class="info">
                        <span class="content_title">카테고리</span>
                        <select name="kinds" class="category" required>
                            <option value="" disabled selected>종류별</option>
                            <option value="밑반찬">밑반찬</option>
                            <option value="메인반찬">메인반찬</option>
                            <option value="국/탕">국/탕</option>
                            <option value="찌개">찌개</option>
                            <option value="디저트">디저트</option>
                            <option value="면/만두">면/만두</option>
                            <option value="밥/죽/떡">밥/죽/떡</option>
                            <option value="퓨전">퓨전</option>
                            <option value="김치/젓갈/장류">김치/젓갈/장류</option>
                            <option value="양념/소스/잼">양념/소스/잼</option>
                            <option value="양식">양식</option>
                            <option value="샐러드">샐러드</option>
                            <option value="스프">스프</option>
                            <option value="빵">빵</option>
                            <option value="과자">과자</option>
                            <option value="차/음료/술">차/음료/술</option>
                            <option value="기타">기타</option>
                        </select>
                        <select name="situation" class="category" required>
                            <option value="" disabled selected>상황별</option>
                            <option value="일상">일상</option>
                            <option value="초스피드">초스피드</option>
                            <option value="손님접대">손님접대</option>
                            <option value="술안주">술안주</option>
                            <option value="다이어트">다이어트</option>
                            <option value="도시락">도시락</option>
                            <option value="영양식">영양식</option>
                            <option value="간식">간식</option>
                            <option value="야식">야식</option>
                            <option value="푸드스타일링">푸드스타일링</option>
                            <option value="해장">해장</option>
                            <option value="명절">명절</option>
                            <option value="이유식">이유식</option>
                            <option value="기타">기타</option>
                        </select>
                        <select name="section" class="category" required>
                            <option value="" disabled selected>방법별</option>
                            <option value="볶음">볶음</option>
                            <option value="끓이기">끓이기</option>
                            <option value="부침">부침</option>
                            <option value="조림">조림</option>
                            <option value="무침">무침</option>
                            <option value="비빔">비빔</option>
                            <option value="찜">찜</option>
                            <option value="절임">절임</option>
                            <option value="튀김">튀김</option>
                            <option value="삶기">삶기</option>
                            <option value="굽기">굽기</option>
                            <option value="데치기">데치기</option>
                            <option value="회">회</option>
                            <option value="기타">기타</option>
                        </select>
                        <select name="ingredient" class="category" required>
                            <option value="" disabled selected>재료별</option>
                            <option value="곡류">곡류</option>
                            <option value="면/만두류">면/만두류</option>
                            <option value="빵류">빵류</option>
                            <option value="과자류">과자류</option>
                            <option value="떡류">떡류</option>
                            <option value="감자/고구마류">감자/고구마류</option>
                            <option value="묵/두부">묵/두부</option>
                            <option value="콩/견과류">콩/견과류</option>
                            <option value="채소류">채소류</option>
                            <option value="과일류">과일류</option>
                            <option value="고기류">고기류</option>
                            <option value="햄/소시지">햄/소시지</option>
                            <option value="계란류">계란류</option>
                            <option value="어패류">어패류</option>
                            <option value="해조류">해조류</option>
                            <option value="유제품/치즈류">유제품/치즈류</option>
                            <option value="양념류">양념류</option>
                            <option value="초콜렛/사탕">초콜렛/사탕</option>
                            <option value="음료/주류">음료/주류</option>
                        </select>
                        <span class="guide first"><i class="fas fa-highlighter"></i> 분류를 바르게 설정해주시면, 이용자들이 쉽게 레시피를 검색할 수 있어요.</span>
                    </div>
                    <div class="info">
                        <span class="content_title">요리 정보</span>
                        <span class="info_fav"><i class="fas fa-users"></i> &nbsp;</span>
                        <select name="person" class="info_select" required>
                            <option value="" disabled selected>인원</option>
                            <option value="1">1인분</option>
                            <option value="2">2인분</option>
                            <option value="3">3인분</option>
                            <option value="4">4인분</option>
                            <option value="5">5인분</option>
                            <option value="6">6인분 이상</option>
                        </select>
                        <span class="info_fav"> &nbsp;<i class="fas fa-stopwatch"></i> &nbsp;</span>
                        <select name="time" class="info_select" required>
                            <option value="" disabled selected>시간</option>
                            <option value="5">5분 이내</option>
                            <option value="10">10분 이내</option>
                            <option value="15">15분 이내</option>
                            <option value="20">20분 이내</option>
                            <option value="30">30분 이내</option>
                            <option value="60">60분 이내</option>
                            <option value="90">90분 이내</option>
                            <option value="120">2시간 이내</option>
                            <option value="121">2시간 이상</option>
                        </select>
                        <span class="info_fav"> &nbsp;<i class="fab fa-buromobelexperte"></i> &nbsp;</span>
                        <select name="step" class="info_select" required>
                            <option value="" disabled selected>난이도</option>
                            <option value="아무나">아무나</option>
                            <option value="초급">초급</option>
                            <option value="중급">중급</option>
                            <option value="고급">고급</option>
                            <option value="5성급">5성급 쉐프</option>
                        </select>
                    </div>
                </div><!-- contentWrap -->
                <div class="photoWrap">
                        <label class="hero photoBox"><i class="fas fa-plus"></i>
                            <input type="file" class="img pp" name="pic" accept="image/*" required/>
                            <img class="pic bpic"/> 
                            <button class="d_button" type="button">X</button>
                        </label>
                    <label class="photoBox"><i class="fas fa-plus"></i>
                        <input type="file" class="img p1" name="pic1" accept="image/*"/>
                        <img class="pic spic" />
                        <button class="d_button" type="button">X</button>
                    </label>
                    <label class="photoBox"><i class="fas fa-plus"></i>
                        <input type="file" class="img p2" name="pic2" accept="image/*"/>
                        <img class="pic spic" />
                        <button class="d_button" type="button">X</button>
                    </label>
                    <label class="photoBox"><i class="fas fa-plus"></i>
                        <input type="file" class="img p3" name="pic3" accept="image/*"/>
                        <img class="pic spic"/>
                        <button class="d_button" type="button">X</button>
                    </label>
                    <label class="photoBox"><i class="fas fa-plus"></i>
                        <input type="file" class="img p4" name="pic4" accept="image/*"/>
                        <img class="pic spic" />
                        <button class="d_button" type="button">X</button>
                    </label>
                </div><!-- photoWrap end -->
            </div><!-- contentBox end -->

            <!-- 재료 -->
            <div class="contentBox">
                <span class="guide second"><i class="fas fa-highlighter"></i> 재료가 남거나 부족하지 않도록 정확한 계량 정보를 적어주세요.</span>
                <div class="title">재료</div>
                <div class="open">내 냉장고 열기</div>
                <span class="guide third"><i class="fas fa-highlighter"></i> 대표 재료(꼭 필요한 재료)는 체크해주세요.</span>
                <ul class="ingredient">
                    <li>
                        <label class="container">
                            <input type="checkbox" name="vital"/>
                            <input type="hidden" name="ingCheck">
                            <span class="checkmark"></span>
                        </label>
                        <input class="detail mat 1 autocomplete" name="ingredientName" data-num="1" placeholder="재료를 적어주세요" required>
                        <input type="hidden" class="ingNo" name="ingNo" required/>
                        <input class="detail" name="gram" placeholder="수량" required>
                        <select name="unit" required>
                            <option value="" disabled selected>단위</option>
                            <option value="g">g</option>
                            <option value="kg">kg</option>
                            <option value="개">개</option>
                            <option value="큰술">큰술(T, Ts)</option>
                            <option value="작은술">작은술(t, ts)</option>
                            <option value="컵">컵</option>
                            <option value="ml">ml</option>
                            <option value="L">L</option>
                            <option value="oz">oz</option>
                            <option value="파운드">파운드</option>
                            <option value="갤런">갤런</option>
                            <option value="꼬집">꼬집</option>
                            <option value="조금">조금</option>
                            <option value="적당량">적당량</option>
                            <option value="줌">줌</option>
                            <option value="주먹">주먹</option>
                            <option value="토막">토막</option>
                            <option value="톨">톨</option>
                            <option value="쪽">쪽</option>
                            <option value="근">근</option>
                            <option value="봉지">봉지</option>
                        </select>
                        <span class="close">&nbsp;<i class="fas fa-times"></i></span>
                    </li>
                </ul><!-- ingredient end -->
                <div class="add" id="addIngredient"><i class="fas fa-plus"></i> 재료 추가하기</div>
            </div><!-- contentBox end -->

            <!-- 도구 -->
            <div class="contentBox">
                <span class="guide forth"><i class="fas fa-highlighter"></i> 대표 도구(꼭 필요한 도구)는 체크해주세요.</span>
                <div class="title">도구</div>
                <ul class="tool">
                    <li>
                        <label class="container">
                            <input type="checkbox" name="vital2">
                            <input type="hidden" name="toolCheck">
                            <span class="checkmark"></span>
                        </label>
                        <input class="detail autocomplete2" name="tool" placeholder="도구를 선택해주세요" readonly required>
                        <input type="hidden" class="toolNo" name="toolNo"/>
                        <select required>
                            <option value="도구" disabled selected>도구</option>
                            <option value="가스레인지">가스레인지</option>
                            <option value="그릴">그릴</option>
                            <option value="찜통">찜통</option>
                            <option value="뚝배기">뚝배기</option>
                            <option value="반합">반합</option>
                            <option value="밥솥">밥솥</option>
                            <option value="브로일러">브로일러</option>
                            <option value="사발">사발</option>
                            <option value="석쇠">석쇠</option>
                            <option value="시루">시루</option>
                            <option value="에어 프라이어">에어 프라이어</option>
                            <option value="오븐">오븐</option>
                            <option value="와플기">와플기</option>
                            <option value="전기찜솥">전기찜솥</option>
                            <option value="전자레인지">전자레인지</option>
                            <option value="용기">용기</option>
                            <option value="주전자">주전자</option>
                            <option value="찜기">찜기</option>
                            <option value="칵테일 셰이커">칵테일 셰이커</option>
                            <option value="커피메이커">커피메이커</option>
                            <option value="토스터">토스터</option>
                            <option value="직접 입력">직접 입력</option>
                        </select>
                        <span class="close">&nbsp;<i class="fas fa-times"></i></span>
                    </li>
                </ul><!-- tool end -->
                <div class="add" id="addTool"><i class="fas fa-plus"></i> 도구 추가하기</div>
            </div><!-- contentBox end -->

            <!-- 요리 순서 -->
            <div class="contentBox">
                <div class="title">요리 순서</div>
                <div class="guide fifth"><i class="fas fa-highlighter"></i> 요리에 꼭 ! 필요한 부분은 빠짐없이 다 ~ 적어주세요.</div>
                <ul class="order" id="recipe">
                    <li class="gogo">
                        <div class="recipe_order count">1 Go</div>
                        <div class="recipe_order">
                            <textarea name="contents" placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요." required></textarea>
                        </div>
                        <label class="recipe_order photoBox recipePhoto"><i class="fas fa-plus"></i>
                            <input type="file" class="img contnetimg" name="image" accept="image/*"/>
                        	<img class="pic spic2" />
                        	<button class="d_button" type="button">X</button>
                        </label>
                        <div class="recipe_order recipeScroll">
                            <div class="scroll up"><i class="fas fa-chevron-up"></i></div>
                            <div class="scroll delete"><i class="fas fa-times"></i></div>
                            <div class="scroll down"><i class="fas fa-chevron-down"></i></div>
                        </div>
                        <div class="recipe_order recipeTip">
                            <div class="recipe_Tip show">
                                <div class="recipe_type"><i class="fas fa-carrot"></i> 재료</div>
                                <div class="recipe_type"><i class="fas fa-dumpster"></i> 도구</div>
                                <div class="recipe_type"><i class="fas fa-fire-alt"></i> 불</div>
                                <div class="recipe_type"><i class="fas fa-stopwatch"></i> 시간</div>
                                <div class="recipe_type"><i class="fas fa-pencil-alt"></i> 팁</div>
                                <div class="recipe_type">전체</div>
                            </div>
                            <div class="recipe_Tip one">
                                <div class="fav_wrap"><i class="fas fa-carrot"></i></div>
                                <input value="" name="ingredients" placeholder=" 밀가루 200g, 물 100g, 소금 2큰술">
                                <div class="remove"><i class="fas fa-times"></i></div>
                            </div>

                            <div class="recipe_Tip two">
                                <div class="fav_wrap"><i class="fas fa-dumpster"></i></div>
                                <input value="" name="tools" placeholder=" 국자, 볼">
                                <div class="remove"><i class="fas fa-times"></i></div>
                            </div>
                            <div class="recipe_Tip three">
                                <div class="fav_wrap"><i class="fas fa-fire-alt"></i></div>
                                <input value="" name="fire" placeholder=" 약불">
                                <div class="remove"><i class="fas fa-times"></i></div>
                            </div>
                            <div class="recipe_Tip four">
                                <div class="fav_wrap"><i class="fas fa-stopwatch"></i></div>
                                <input value="" name="times" placeholder=" 10분">
                                <div class="remove"><i class="fas fa-times"></i></div>
                            </div>
                            <div class="recipe_Tip five">
                                <div class="fav_wrap"><i class="fas fa-pencil-alt"></i></div>
                                <input value="" name="tips" placeholder=" 저어주면서 끓인다">
                                <div class="remove"><i class="fas fa-times"></i></div>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="add" id="addRecipe"><i class="fas fa-plus"></i> 요리 순서 추가하기</div>
            </div><!-- contentBox end -->

            <!-- 꿀팁 -->
            <div class="contentBox">
                <div class="title">꿀팁</div>
                <textarea id="honeyTip" name="tip" placeholder="예) 고기요리에는 소금보다 설탕을 먼저 넣어야 단맛이 겉돌지 않고 육질이 부드러워요."></textarea>
            </div><!-- contentBox end -->
		
	

            <!-- 태그 -->
            <div class="contentBox">
                <div class="title">태그</div>
                <input id="tag" name="tag" type="text" value="">
                <!-- tag end -->
            </div><!-- contentBox end -->
            <div class="btn_wrap">
                <button class="btn cancel">취소</button>
                <button class="btn submit">저장</button>
                <button class="btn submit" type="submit">등록</button>
            </div><!-- btn_wrap end -->
        </fieldset>
    </form>
</div><!-- insertRecipeWrap -->
<div class="side_bar">
    <div class="side_title">내 재료</div>
    <div class="side_content">
       <!--  <div class="side_ingredient"></div> -->
    </div>
</div>

<!---------------------------------------------footer------------------------------------------------------>
<c:import url="/WEB-INF/template/footer.jsp"/>

<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/header.js"></script>
<script src="/js/jquery.tagsinput-revisited.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

	var ingredientArray = new Array();
	var ingredientNoArray = new Array();

	var toolArray = new Array();
	var toolNoArray = new Array();

	<c:forEach items="${ingredientList }" var="ing">
		ingredientArray.push("${ing.name}");
		ingredientNoArray.push("${ing.no}");
		//alert("${ing.name}");
		
	</c:forEach>
	
	<c:forEach items="${toolList}" var="tool">
		toolArray.push("${tool.name}");
		toolNoArray.push("${tool.no}");
		//alert("${tool.name}");
		
	</c:forEach>
	
		//alert(ingredientArray[40]);
	
		//alert("${seq}");
	
	var list = new Array();

    var cnt = 1;
    //재료 추가
    $("#addIngredient").click(function () {
        cnt++;
        $("<li>\n" +
            "                        <label class=\"container\">\n" +
            "                            <input type=\"checkbox\" name=\"vital\">\n" +
            "                            <input type=\"hidden\" name=\"ingCheck\">\n" +
            "                            <span class=\"checkmark\"></span>\n" +
            "                        </label>\n" +
            "                        <input class=\"detail mat 1 autocomplete\" name=\"ingredientName\" data-num=\""+cnt+"\" placeholder=\"재료를 적어주세요\" autocomplete=\"off\" required>\n" +
            "                        <input class=\"detail\" name=\"gram\" placeholder=\"수량\" required>\n" +
            "                        <input type=\"hidden\" class=\"ingNo\" name=\"ingNo\"/>\n" +
            "                        <select name=\"unit\" required>\n" +
            "                            <option value=\"\" disabled selected>단위</option>\n" +
            "                            <option value=\"g\">g</option>\n" +
            "                            <option value=\"kg\">kg</option>\n" +
            "                            <option value=\"개\">개</option>\n" +
            "                            <option value=\"큰술\">큰술(T, Ts)</option>\n" +
            "                            <option value=\"작은술\">작은술(t, ts)</option>\n" +
            "                            <option value=\"컵\">컵</option>\n" +
            "                            <option value=\"ml\">ml</option>\n" +
            "                            <option value=\"L\">L</option>\n" +
            "                            <option value=\"oz\">oz</option>\n" +
            "                            <option value=\"파운드\">파운드</option>\n" +
            "                            <option value=\"갤런\">갤런</option>\n" +
            "                            <option value=\"꼬집\">꼬집</option>\n" +
            "                            <option value=\"조금\">조금</option>\n" +
            "                            <option value=\"적당량\">적당량</option>\n" +
            "                            <option value=\"줌\">줌</option>\n" +
            "                            <option value=\"주먹\">주먹</option>\n" +
            "                            <option value=\"토막\">토막</option>\n" +
            "                            <option value=\"톨\">톨</option>\n" +
            "                            <option value=\"쪽\">쪽</option>\n" +
            "                            <option value=\"근\">근</option>\n" +
            "                            <option value=\"봉지\">봉지</option>\n" +
            "                        </select>\n" +
            "                        <span class=\"close\">&nbsp;<i class=\"fas fa-times\"></i></span>\n" +
            "                    </li>").appendTo(".ingredient");

        auto();
        
        rightBoxMatch();
        
    });
    //재료 삭제
    $(".ingredient").on('click', '.close', function () {
        var a = $(this).prev().prev().prev().attr('data-num');
        $(".side_content").find("."+a+"").remove();

        $(this).parent().remove();
        rightBoxMatch();

    });
    //도구 추가
    $("#addTool").click(function () {
        $("<li>\n" +
            "                        <label class=\"container\">\n" +
            "                            <input type=\"checkbox\" name=\"vital2\">\n" +
            "                            <input type=\"hidden\" name=\"toolCheck\">\n" +
            "                            <span class=\"checkmark\"></span>\n" +
            "                        </label>\n" +
            "                        <input class=\"detail autocomplete2\" name=\"tool\" placeholder=\"도구를 선택해주세요\" readonly required>\n" +
            "                        <input type=\"hidden\" class=\"toolNo\" name=\"toolNo\"/>\n" +
            "                        <select required>\n" +
            "                            <option value=\"도구\" disabled selected>도구</option>\n" +
            "                            <option value=\"가스레인지\">가스레인지</option>\n" +
            "                            <option value=\"그릴\">그릴</option>\n" +
            "                            <option value=\"찜통\">찜통</option>\n" +
            "                            <option value=\"뚝배기\">뚝배기</option>\n" +
            "                            <option value=\"반합\">반합</option>\n" +
            "                            <option value=\"밥솥\">밥솥</option>\n" +
            "                            <option value=\"브로일러\">브로일러</option>\n" +
            "                            <option value=\"사발\">사발</option>\n" +
            "                            <option value=\"석쇠\">석쇠</option>\n" +
            "                            <option value=\"시루\">시루</option>\n" +
            "                            <option value=\"에어 프라이어\">에어 프라이어</option>\n" +
            "                            <option value=\"오븐\">오븐</option>\n" +
            "                            <option value=\"와플기\">와플기</option>\n" +
            "                            <option value=\"전기찜솥\">전기찜솥</option>\n" +
            "                            <option value=\"전자레인지\">전자레인지</option>\n" +
            "                            <option value=\"용기\">용기</option>\n" +
            "                            <option value=\"주전자\">주전자</option>\n" +
            "                            <option value=\"찜기\">찜기</option>\n" +
            "                            <option value=\"칵테일 셰이커\">칵테일 셰이커</option>\n" +
            "                            <option value=\"커피메이커\">커피메이커</option>\n" +
            "                            <option value=\"토스터\">토스터</option>\n" +
            "                            <option value=\"직접 입력\">직접 입력</option>\n" +
            "                        </select>\n" +
            "                        <span class=\"close\">&nbsp;<i class=\"fas fa-times\"></i></span>\n" +
            "                    </li>").appendTo(".tool");
        auto2();
    });
    //도구 삭제
    $(".tool").on('click', '.close', function () {
        $(this).parent().remove();
    });
    //도구 직접 입력 + name=tool value 설정
    $(".tool").on('change', 'select', function () {
        var tool = $(this).val();
        if (tool == "직접 입력") {
            $(this).prev().prev().removeAttr("readonly");
            $(this).prev().prev().focus();
        } else {
            $(this).prev().prev().attr('readonly', 'readonly');
            
            $(this).prev().prev().val(tool);
        }
    });

    //go 숫자 카운트
    function go(){
        var gogoCount = $('.order').find('.gogo').length;
        for(var i=0;i <=gogoCount; i++){
            $('.gogo').eq(i).find('.count').text(i+1+"Go");
        }
    }
    //요리 추가
    $("#addRecipe").click(function () {
        $("<li class=\"gogo\">\n" +
            "                        <div class=\"recipe_order count\">1 Go</div>\n" +
            "                        <div class=\"recipe_order\">\n" +
            "                            <textarea name=\"contents\" placeholder=\"예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요.\" required></textarea>\n" +
            "                        </div>\n" +
            "                        <label class=\"recipe_order photoBox recipePhoto\"><i class=\"fas fa-plus\"></i>\n" +
            "                            <input type=\"file\" class=\"img contnetimg\" name=\"image\" accept=\"image/*\"/>\n" +
            "                            <img class=\"pic spic2\" >\n" +
            "                            <button class=\"d_button\" type=\"button\">X</button>\n" +
            "                        </label>\n" +
            "                        <div class=\"recipe_order recipeScroll\">\n" +
            "                            <div class=\"scroll up\"><i class=\"fas fa-chevron-up\"></i></div>\n" +
            "                            <div class=\"scroll delete\"><i class=\"fas fa-times\"></i></div>\n" +
            "                            <div class=\"scroll down\"><i class=\"fas fa-chevron-down\"></i></div>\n" +
            "                        </div>\n" +
            "                        <div class=\"recipe_order recipeTip\">\n" +
            "                            <div class=\"recipe_Tip show\">\n" +
            "                                <div class=\"recipe_type\"><i class=\"fas fa-carrot\"></i> 재료</div>\n" +
            "                                <div class=\"recipe_type\"><i class=\"fas fa-dumpster\"></i> 도구</div>\n" +
            "                                <div class=\"recipe_type\"><i class=\"fas fa-fire-alt\"></i> 불</div>\n" +
            "                                <div class=\"recipe_type\"><i class=\"fas fa-stopwatch\"></i> 시간</div>\n" +
            "                                <div class=\"recipe_type\"><i class=\"fas fa-pencil-alt\"></i> 팁</div>\n" +
            "                                <div class=\"recipe_type\">전체</div>\n" +
            "                            </div>\n" +
            "                            <div class=\"recipe_Tip one\">\n" +
            "                                <div class=\"fav_wrap\"><i class=\"fas fa-carrot\"></i></div>\n" +
            "                                <input name=\"ingredients\" placeholder=\" 밀가루 200g, 물 100g, 소금 2큰술\">\n" +
            "                                <div class=\"remove\"><i class=\"fas fa-times\"></i></div>\n" +
            "                            </div>\n" +
            "\n" +
            "                            <div class=\"recipe_Tip two\">\n" +
            "                                <div class=\"fav_wrap\"><i class=\"fas fa-dumpster\"></i></div>\n" +
            "                                <input name=\"tools\" placeholder=\" 국자, 볼\">\n" +
            "                                <div class=\"remove\"><i class=\"fas fa-times\"></i></div>\n" +
            "                            </div>\n" +
            "                            <div class=\"recipe_Tip three\">\n" +
            "                                <div class=\"fav_wrap\"><i class=\"fas fa-fire-alt\"></i></div>\n" +
            "                                <input name=\"fire\" placeholder=\" 약불\">\n" +
            "                                <div class=\"remove\"><i class=\"fas fa-times\"></i></div>\n" +
            "                            </div>\n" +
            "                            <div class=\"recipe_Tip four\">\n" +
            "                                <div class=\"fav_wrap\"><i class=\"fas fa-stopwatch\"></i></div>\n" +
            "                                <input name=\"times\" placeholder=\" 10분\">\n" +
            "                                <div class=\"remove\"><i class=\"fas fa-times\"></i></div>\n" +
            "                            </div>\n" +
            "                            <div class=\"recipe_Tip five\">\n" +
            "                                <div class=\"fav_wrap\"><i class=\"fas fa-pencil-alt\"></i></div>\n" +
            "                                <input name=\"tips\" placeholder=\" 저어주면서 끓인다\">\n" +
            "                                <div class=\"remove\"><i class=\"fas fa-times\"></i></div>\n" +
            "                            </div>\n" +
            "                        </div>\n" +
            "                    </li>").appendTo(".order");
        go();
    });
    //요리 삭제
    $(".order").on('click', '.delete', function () {
        $(this).parent().parent().remove();
        go();
    });

    //태그 입력
    $('#tag').tagsInput({

        // allows new tags
        interactive: true,

        placeholder: '태그를 입력하세요',

        // width/height
        width: '820px',
        height: 'auto',

        // hides the regular input field
        hide: true,

        // custom delimiter
        delimiter: ',',

        // removes tags with backspace
        removeWithBackspace: true

    });

    //요리 detail tip 추가
    $(".order").on('click','.recipe_type',function () {
        var id = $(this).text();
        switch (id) {
            case " 재료" :
                $(this).parents('.recipe_order').find('.one').addClass('show');
                break;
            case ' 도구':
                $(this).parents('.recipe_order').find('.two').addClass('show');
                break;
            case " 불" :
                $(this).parents('.recipe_order').find('.three').addClass('show');
                break;
            case " 시간" :
                $(this).parents('.recipe_order').find('.four').addClass('show');
                break;
            case " 팁" :
                $(this).parents('.recipe_order').find('.five').addClass('show');
                break;
            case "전체" :
                $(this).parents('.recipe_order').find('.one').addClass('show');
                $(this).parents('.recipe_order').find('.two').addClass('show');
                $(this).parents('.recipe_order').find('.three').addClass('show');
                $(this).parents('.recipe_order').find('.four').addClass('show');
                $(this).parents('.recipe_order').find('.five').addClass('show');
                break;
            default:
                break;
        }

    });

    $(".order").on("click",".up",function () {
        var srcDiv = $(this).parents(".gogo");
        var tgtDiv = srcDiv.prev();
        if (tgtDiv[0]) {
            tgtDiv.before(srcDiv);
        }
        var order = getOrder(".gogo", $(".order")[0]);
        console.log(order);
        go();
    });

    $(".order").on("click", ".down",function () {
        var srcDiv = $(this).parents(".gogo");
        var tgtDiv = srcDiv.next();
        if (tgtDiv[0]) {
            tgtDiv.after(srcDiv);
        }
        var order = getOrder(".gogo", $(".order")[0]);
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


    $(".ingredient").on('change','.mat',function () {
       var detail = $(this).val();
       $("<div class=\"side_ingredient "+cnt+"\">").text(detail).appendTo(".side_content");
    });

    $(".order").on('click','.remove',function () {
        $(this).parent().removeClass('show');

    });
    
    /* --------------------------------------------------------------------- */
    
    
    //ajax 처리 - 이미지파일 - pp, p1, p2, p3, p4

    
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
			
			var $imgBox = $this.parent();
			
			var $event_img_main = $imgBox.find(".pic");
			
			var $img_name = $imgBox.find(".img");
			
			var $delete_button = $imgBox.find(".d_button");
			
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
					//alert("이미지 넣기 성공!");
					$event_img_main.attr("src", "/upload/" + file1.name);
					var iimm = "/upload/" + file1.name;
					$delete_button.show();
				}
				
			});
			
		}
		
	}
    

	$(".pp").change(checkImg);
	$(".p1").change(checkImg);
	$(".p2").change(checkImg);
	$(".p3").change(checkImg);
	$(".p4").change(checkImg);
    
	
	
	//ajax 이미지 처리 - 요리 순서 이미지

	
	var imgReg2 = /^image/;
	var oldImg2 = null;
    
    
	function checkImg2() {
		
		
		var eventImg = $(this).get(0);
		
		var file1 = eventImg.files[0];
		
		console.log(file1);
		
		if(file1 == null || file1.size <= 0) {
			alert("제대로 된 파일을 넣어주세요!");
			return;
		}
		
		if(!imgReg2.test(file1.type)) {
			alert("이미지 파일을 선택해주세요!");
			return;
		}
		
		
		if(oldImg2 != file1.name) {
			oldImg2 = file1.name;
			
			var form = new FormData();
			
			form.append("uploadImg", file1, file1.name);
			
			var $this = $(this);
			
			var $imgBox = $this.parent();
			
			var $event_img_main = $imgBox.find(".pic");
			
			var $img_name = $imgBox.find(".img");
			
			var $delete_button = $imgBox.find(".d_button");
			
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
					//alert("이미지 넣기 성공!");
					$event_img_main.attr("src", "/upload/" + file1.name);
					$img_name.val("/upload/"+file1.name);
					$delete_button.show();
				
				}
				
			});
			
		}
		
	}
	
	$("body").on("change", ".contnetimg", checkImg2);
	
	//$(".contnetimg").change(checkImg2);
	
	/*********************************************************************************/
	
	//냉장고----------
	
	function addLi(num, text) {
		cnt++;
        $("<li>\n" +
            "                        <label class=\"container\">\n" +
            "                            <input type=\"checkbox\" name=\"vital\">\n" +
            "                            <input type=\"hidden\" name=\"ingCheck\">\n" +
            "                            <span class=\"checkmark\"></span>\n" +
            "                        </label>\n" +
            "                        <input class=\"detail mat 1 autocomplete\" name=\"ingredientName\" data-num=\""+cnt+"\" placeholder=\"재료를 적어주세요\" autocomplete=\"off\" required value='" + text + "' >\n" +
            "                        <input class=\"detail\" name=\"gram\" placeholder=\"수량\" required>\n" +
            "                        <input type=\"hidden\" class=\"ingNo\" name=\"ingNo\" value='" + num + "'/>\n" +
            "                        <select name=\"unit\" required>\n" +
            "                            <option value=\"\" disabled selected>단위</option>\n" +
            "                            <option value=\"g\">g</option>\n" +
            "                            <option value=\"kg\">kg</option>\n" +
            "                            <option value=\"개\">개</option>\n" +
            "                            <option value=\"큰술\">큰술(T, Ts)</option>\n" +
            "                            <option value=\"작은술\">작은술(t, ts)</option>\n" +
            "                            <option value=\"컵\">컵</option>\n" +
            "                            <option value=\"ml\">ml</option>\n" +
            "                            <option value=\"L\">L</option>\n" +
            "                            <option value=\"oz\">oz</option>\n" +
            "                            <option value=\"파운드\">파운드</option>\n" +
            "                            <option value=\"갤런\">갤런</option>\n" +
            "                            <option value=\"꼬집\">꼬집</option>\n" +
            "                            <option value=\"조금\">조금</option>\n" +
            "                            <option value=\"적당량\">적당량</option>\n" +
            "                            <option value=\"줌\">줌</option>\n" +
            "                            <option value=\"주먹\">주먹</option>\n" +
            "                            <option value=\"토막\">토막</option>\n" +
            "                            <option value=\"톨\">톨</option>\n" +
            "                            <option value=\"쪽\">쪽</option>\n" +
            "                            <option value=\"근\">근</option>\n" +
            "                            <option value=\"봉지\">봉지</option>\n" +
            "                        </select>\n" +
            "                        <span class=\"close\">&nbsp;<i class=\"fas fa-times\"></i></span>\n" +
            "                    </li>").appendTo(".ingredient");

        auto();
		
	}
	
	
		$('#lastForm').submit(function(){
		       return false;
		    });
		    
		    $('#goBtn').click(function(e){
		    	var text1 = "";
		    	var nums1 = "";
		       $('.no_checked.on').each(function(){
		    	   
		    	   
		    	   
		    	   text1 = text1+$(this).next().next().next().next().val() + ","
		    	   nums1 = nums1 + $(this).next().next().next().next().next().val() + ",";
		    	   //alert("text : " + text1);
		    	   //alert("nums1 : " + nums1)
		       });
		       	nums1 = nums1.substring(0, nums1.length-1);
		       	text1 = text1.substring(0, text1.length-1);
		       	//alert(nums1 + " / " + text1);
		       	
		       	var numArray = new Array();
		       	var textArray = new Array();
		       	
		       	numArray = nums1.split(",");
		       	textArray = text1.split(",");
		       	
		       	for(var i=0; i< numArray.length; i++) {
		       		//alert(numArray[i] + " / " + textArray[i]);
		       		addLi(numArray[i], textArray[i]);
		       		
		       		
		       	}
		       	
		       	
			    $("#refPopup").hide();
			    $("#popup").hide();
		    });
			
		    
		    
		    $(".open").click(function() {
		    	if(userNo>=1){
		    		loginUserGettIceBox(userNo);
		    	}
		    	getBaseAtom(1);
		        $("#refPopup").show();
		        $("#popup").show();
			});
	
	
	
	
	
    /****************************************************************************/
    
    
    $("body").on("click", ".d_button", function () {
		$(this).prev().attr("src", "");
		$(this).prev().prev().val("");
		$(this).hide();
	})
    
    function auto() {
    	var autocomplete_ingredient = ingredientArray;
    	$(".autocomplete").autocomplete({
    		source: autocomplete_ingredient,
        	minLength: 2,
        	select: function( event, ui ) {
                // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
                //alert($(".ingredient").find("li").find(".autocomplete").val());
            }
    	});
   	}
    
    auto();

    function auto2() {
    	var autocomplete_tool = toolArray;
    	$(".autocomplete2").autocomplete({
    		source: autocomplete_tool,
        	minLength: 1,
        	select: function( event, ui ) {
                // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
            }
    	});
   	}
    
    auto2();
    
	$(".gogo").eq(0).children().eq(4).find(".one").find("input").val("");
	$(".gogo").eq(0).children().eq(4).find(".two").find("input").val("");
	$(".gogo").eq(0).children().eq(4).find(".three").find("input").val("");
	$(".gogo").eq(0).children().eq(4).find(".four").find("input").val("");
	$(".gogo").eq(0).children().eq(4).find(".five").find("input").val("");

	function formSubmit() {

	//Order 처리
	
	//요리순서 총 갯수
	var cookLength = $(".order .gogo").length;
	console.log(cookLength);

	var allContentsParam = "";
	var allIngParam = "";
	var allToolsParam = "";
	var allFireParam = "";
	var allTimesParam = "";
	var allTipsParam = "";
	
	/*
	for(var i=0; i<cookLength; i++) {
		allContentsParam = allContentsParam + $(".gogo").eq(i).children().eq(1).find("textarea").val() + "#";
		allIngParam = allIngParam + $(".gogo").eq(i).children().eq(4).find(".one").find("input").val() + "#";
		//alert($(".gogo").eq(i).children().eq(4).find(".one").find("input").val());
		allToolsParam = allToolsParam + $(".gogo").eq(i).children().eq(4).find(".two").find("input").val() + "#";
		allFireParam = allFireParam + $(".gogo").eq(i).children().eq(4).find(".three").find("input").val() + "#";
		allTimesParam = allTimesParam + $(".gogo").eq(i).children().eq(4).find(".four").find("input").val() + "#";
		allTipsParam = allTipsParam + $(".gogo").eq(i).children().eq(4).find(".five").find("input").val() + "#";
	}
	//맨 뒤의 , 잘라내기
	allContentsParam = allContentsParam.substr(0, allContentsParam.length-1);
	allIngParam = allIngParam.substr(0, allIngParam.length-1);
	allToolsParam = allToolsParam.substr(0, allToolsParam.length-1);
	allFireParam = allFireParam.substr(0, allFireParam.length-1);
	allTimesParam = allTimesParam.substr(0, allTimesParam.length-1);
	allTipsParam = allTipsParam.substr(0, allTipsParam.length-1);
	//alert(allContentsParam);
	
	$(".gogo").eq(0).children().eq(1).find("textarea").val(allContentsParam);
	$(".gogo").eq(0).children().eq(4).find(".one").find("input").val(allIngParam);
	$(".gogo").eq(0).children().eq(4).find(".two").find("input").val(allToolsParam);
	$(".gogo").eq(0).children().eq(4).find(".three").find("input").val(allFireParam);
	$(".gogo").eq(0).children().eq(4).find(".four").find("input").val(allTimesParam);
	$(".gogo").eq(0).children().eq(4).find(".five").find("input").val(allTipsParam);
*/


	//alert(ingredientArray[2]); 누룽지
	


	
//재료 부분 : 성공함
	var ingLength = $(".ingredient").find("li").length;
	var ingAddNo = 20 + ingredientArray.length - 1;
	//var allIng = "";
	
	for(var i=0; i<ingLength; i++) {
		//allIng = allIng + $(".ingredient").children().eq(i).find(".autocomplete").val() + ",";
		if(ingredientArray.indexOf($(".ingredient").children().eq(i).find(".autocomplete").val()) != -1) {
			//alert("일치");
			var ingNumber = ingredientArray.indexOf($(".ingredient").children().eq(i).find(".autocomplete").val()) + 20;
			$(".ingredient").children().eq(i).find(".ingNo").val(ingNumber);
			
		} else {
			//alert("불일치");
			ingAddNo++;
			$(".ingredient").children().eq(i).find(".ingNo").val(ingAddNo);
		}
		var ingCheck = document.getElementsByName("vital");
		var ingCheckValue = document.getElementsByName("ingCheck");
		
		if(ingCheck[i].checked) {
			//alert("재료 " + i + "번째 체크되어있ㅇ므!");
			ingCheckValue[i].value = "1";
			
		} else {
			//alert("재료 체크안됨");
			ingCheckValue[i].value = "0";
		}
	}
	
	//alert(toolArray[3]);
	//도구 부분 : 성공함
	
	var toolLength = $(".tool").find("li").length;
	var toolAddNo = toolArray.length + 1;
	//var allIng = "";
	//alert(toolAddNo);
	
	for(var i=0; i<toolLength; i++) {
		if(toolArray.indexOf($(".tool").children().eq(i).find(".autocomplete2").val()) != -1) {
			//alert("일치");
			var toolNumber = toolArray.indexOf($(".tool").children().eq(i).find(".autocomplete2").val()) + 1;
			$(".tool").children().eq(i).find(".toolNo").val(toolNumber);
			
		} else {
			//alert("불일치");
			$(".tool").children().eq(i).find(".toolNo").val(toolAddNo);
			toolAddNo++;
		}
		var toolCheck = document.getElementsByName("vital2");
		var toolCheckValue = document.getElementsByName("toolCheck");
		
		if(toolCheck[i].checked) {
			//alert("도구" + i + "번째 체크되어있ㅇ므!");
			toolCheckValue[i].value = "1";
			
		} else {
			//alert("도구 체크안됨");
			toolCheckValue[i].value = "0";
		}
	}
	
	
		//false일 경우 submit이 넘어가지 않는다.
		return true;
	
	}
	
	function rightBoxMatch(){
		$('.side_content').empty();
		$('.ingredient .autocomplete').each(function(){
			if($(this).val().length>0){
				$("<div class=\"side_ingredient "+cnt+"\">").text($(this).val()).appendTo(".side_content");
			}
		});
	}


</script>
</body>
</html>