<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>SEMOYO</title>

    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    
    <link rel="stylesheet" href="/css/index.css">
    
    
</head>
<body>
    <c:import url="/WEB-INF/template/header.jsp"></c:import>

    <!-- best 레시피 -->
    <div id="bestRecipe">
        <div class="best_recipe_wrapAll">
            <div class="best_recipe_wrap">
                <div class="best_recipe_wrap_box">
                
                	<c:forEach begin="1" end="6" items="${recipes }" var="recipe">
	                    <div class="best_recipe_wrap_box_one">
	                        <div class="main_recipe_info">
	                            <div class="main_recipe_category">
	                                <span>${recipe.kinds } |</span>
	                                <span>${recipe.situation } |</span>
	                                <span>${recipe.section } |</span>
	                                <span>${recipe.ingredient }</span>
	                            </div>
	                            <div class="main_recipe_title">
	                                <a href="/recipe/${recipe.no }"><span>${recipe.title }</span></a>
	                            </div>
	                            <div class="main_recipe_sub">
	                                <span>${recipe.step }, ${recipe.time }분 소요</span>
	                            </div>
	                        </div><!-- // .main_recipe_info -->
	                        <div class="main_recipe_pic"><a href="/recipe/${recipe.no }"><img src="${recipe.pic }" width="540" height="350"></a></div>
	                    </div><!-- // .best_recipe_wrap_box_one -->
                    </c:forEach>

                </div><!-- // .best_recipe_wrap_box -->
            </div><!-- // .best_recipe_wrap -->
            
            <button class="main_recipe_btn left_btn"><i class="fas fa-angle-left"></i></button>
            <button class="main_recipe_btn right_btn"><i class="fas fa-angle-right"></i></button>
        </div><!-- // .best_recipe_wrapAll -->
    </div><!-- // #bestRecipe -->

    <!-- 빅데이터 결과 나온 것들 -->
    <div id="mainBestWrap">
        <ul class="main_best">
            <li class="main_best_one"><a href="/recipe?search=치즈스틱"><img src="/img/치즈.PNG" width="270" height="250"><div class="cover">치즈스틱</div></a></li>
            <li class="main_best_one"><a href="/recipe?search=소고기"><img src="/img/소고기.PNG" width="270" height="250"><div class="cover">소고기</div></a></li>
            <li class="main_best_one"><a href="/recipe?search=치킨"><img src="/img/치킨.PNG" width="270" height="250"><div class="cover">치킨</div></a></li>
            <li class="main_best_one"><a href="/recipe?search=초밥"><img src="/img/초밥.PNG" width="270" height="250"><div class="cover">초밥</div></a></li>
            <li class="main_best_one"><a href="/recipe?search=닭발"><img src="/img/닭발.PNG" width="270" height="250"><div class="cover">닭발</div></a></li>
            <li class="main_best_one"><a href="/recipe?search=차"><img src="/img/녹차.PNG" width="270" height="250"><div class="cover">차</div></a></li>
            <li class="main_best_one"><a href="/recipe?search=도시락"><img src="/img/도시락.PNG" width="270" height="250"><div class="cover">도시락</div></a></li>
            <li class="main_best_one"><a href="/recipe?search=계란"><img src="/img/계란말이.PNG" width="270" height="250"><div class="cover">계란</div></a></li>
        </ul><!-- // .main_best -->
    </div><!-- // #mainBestWrap -->

    <!-- 냉장고 채우기 & 마감임박 나눔 -->
    <div id="refrigeAndGive">
        <div class="refrige_and_give_wrap">
            <div class="give_soon_end">
                <div class="give_box_title">
                    <img src="/img/deadline.png" width="50" height="50"> <span>마감 임박 나눔</span>
                    <a class="more_give" href="/give">더 보러 가기</a>
                </div><!-- // .give_box_title -->

                <div class="give_box">
                
                	<c:forEach begin="0" end="2" items="${gives }" var="give">
	                    <div class="give_box_one">
	                        <img class="give_ing" src="/img/tag-ing.png" width="65" height="65"><span class="give_ing_text">진행</span>
	                        <span class="give_box_one_deadline">${give.printEndTime() }</span>
	                        <a href="give.html?no=" class="give_box_one_title">${give.title }</a>
	                        <a href="give.html?no=" class="give_box_one_content">${give.contents }</a>
	                        <span class="give_box_one_personnel">
	                        	<c:choose>
	                        		<c:when test="${give.cnt == null }">
	                        			0명 ·
	                        		</c:when>
	                        		<c:otherwise>
	                        			${give.cnt }명 ·
	                        		</c:otherwise>
	                        	</c:choose>
	                        </span>
	                        <span class="give_box_one_nickname">${give.nickname }</span>
	                        <a href="give.html?no="><img class="give_box_one_pic" src="${give.pic1 }" width="110" height="100"></a>
	                    </div><!-- // .give_box_one -->
                    </c:forEach>
                    
                 </div><!-- // .give_box -->
            </div><!-- // .give_soon_end -->

            <div class="refrigerator_go">
                <img class="img1" src="/img/fridgeGo.png" width="120" height="120">
                <img class="img2" src="/img/thinking.png" width="220" height="220">
                <div class="spans">
                    <span class="span1">냉장Go</span>
                    <span class="span2">채우러 Go!</span>
                </div>
            </div><!-- // .refrigerator_go -->
        </div><!-- // .refrige_and_give_wrap -->
    </div><!-- // #refrigeAndGive -->

    <c:import url="/WEB-INF/template/footer.jsp"></c:import>

    <script src="/js/jquery.js"></script>
    <script src="/js/underscore-min.js"></script>
    <script src="/js/fix-footer.js"></script>
    <script src="/js/header.js"></script>
    <script>


        /* best_recipe <,> 클릭 시 */
        var x = 0;
        $(".main_recipe_btn.right_btn").click(function () {
            x += 1080;

            if(x == 1080) { x = -5400; }
            $(".best_recipe_wrap_box").css("left", x);
        });
        $(".main_recipe_btn.left_btn").click(function () {
            x -= 1080;

            if(x == -6480) { x = 0; }
            $(".best_recipe_wrap_box").css("left", x);
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
        
        
     // 냉장고 열기
        $(".refrigerator_go img").click(function () {
        	if(userNo>=1){
        		loginUserGettIceBox(userNo);
        	}
        	getBaseAtom(1);
            $("#refPopup").show();
            $("#popup").show();
        });
     // 냉장고 열기
        $(".refrigerator_go .spans").click(function () {
        	if(userNo>=1){
        		loginUserGettIceBox(userNo);
        	}
        	getBaseAtom(1);
            $("#refPopup").show();
            $("#popup").show();
        });
    </script>





</body>
</html>