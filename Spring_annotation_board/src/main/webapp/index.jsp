<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 추가 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"><!-- 반응형 웹 -->
<title>신선해 농수산물 사이트</title>
<!-- bxslider 실행에 필요한 jquery, bxslider css, js -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css"/>
<script>
	$(document).ready(function() {
		$('.slider').bxSlider({ //.클래스,.bxSlider는 함수
			auto : true,
			speed : 500,//1초 간격으로
			pause : 2500, //잠깐 멈추는 시간
			mode : 'vertical',//수직모드 
			//horizontal : 수평모드(수평으로 넘어가면서 변경),'fade'는 같은 자리에서 이미지 변경
			pager : true, //true면 이미지 밑에 점
			autoHover : true, //마우스를 올리면 이미지 정지
		});
	});
</script>
</head>
<body>
	<div class="title">
		    <nav id="header">
        <div class="header_menu">
            <ul class="header_menu">
                <!-- 로그인 하지 않은 상태 -->
                <c:if test="${empty userName}">
                    <li><a class="header_menu_item" href="login.jsp">로그인</a></li>
                    <li>|</li>
                    <li><a class="header_menu_item1" href="insertUser.jsp">회원가입</a></li>
                    <li>|</li>
                    <li><a class="header_menu_item" href="#">고객센터</a></li>
                </c:if>
                <!-- 로그인 한 상태(관리자) -->                    
                <c:if test="${userName == '관리자'}">
                    <li class="header_menu_item"><span>${userName}님</span></li>
                    <li><a class="header_menu_item" href="logout.do">로그아웃</a></li>
                    <li>|</li>
                    <li><a class="header_menu_item" href="#">관리자 페이지</a></li>
                </c:if>
                <!-- 로그인 한 상태(일반 유저) -->
                <c:if test="${not empty userName and userName ne '관리자'}">
                    <li class="header_menu_item"><span>${userName}님</span></li>
                    <li><a class="header_menu_item" href="logout.do">로그아웃</a></li>
                    <li>|</li>
                    <li><a class="header_menu_item" href="#">마이페이지</a></li>
                    <li>|</li>
                    <li><a class="header_menu_item" href="#">장바구니</a></li>
                    <li>|</li>
                    <li><a class="header_menu_item" href="#">고객센터</a></li>
                </c:if> 
            </ul>
        </div>
    </nav>
		
		<div class="logo_search">
			<div class="header_logo">
				<a href="#"><img src="images/logo.png"></a>
			</div>
		</div>
	</div>
	<div class="menu">
		<div id="navbar">
			<div class="navbar_menu">
				<ul class="navbar_menu_ul">
					<li>
						<a href="#"><img class="ham" src="images/ham.png">전체 상품</a>
							
					<li><a href="#">농산물</a></li>
					<li><a href="#">수산물</a></li>	
					<li><a href="#">축산물</a></li>	
					<li><a href="#">알뜰쇼핑</a></li>
				</ul>
					<div class="search">
						<input type="text" name="keyword" class="search_text"
								placeholder="신선한 바른 먹거리"/>
						<input class="btn_search" type="image" src="images/search.png"/>					
					</div>			
				</div>
			</div>
		</div>
	<div class="slider">
		<div>
			<img src="images/main_banner_1.jpg" />
		</div>
		<div>
			<img src="images/main_banner_2.jpg" />
		</div>
		<div>
			<img src="images/main_banner_3.gif" />
		</div>
		<div>
			<img src="images/main_banner_4.gif" />
		</div>
		<div>
			<img src="images/main_banner_5.gif" />
		</div>
		<div>
			<img src="images/main_banner_6.gif" />
		</div>
		<div>
			<img src="images/main_banner_7.jpg" />
		</div>
		<div>
			<img src="images/main_banner_8.gif" />
		</div>
		</div>
		<br><br>
		<h3>요즘 인기 있는 농수산물</h3>
   <!-- Bootstarp Layout의 Grid 적용 -->
   <div class="row">
      <div class="col-lg-3 col-md-6">
      <!-- Bootstrap Components의 Card 적용 -->
         <div class="card" style="width: 18rem;">
            <img src="./img01/01.jpg" class="card-img-top" alt="노트북 이미지">
            <div class="card-body">
               <h5 class="card-title">레노버 2022 아이디어패드 슬림 1 15AMN7 15.6</h5>
               <p class="card-text">308,990원</p>
               <a href="#" class="btn btn-primary">아이템 상세 보기</a>
            </div>
         </div>        
      </div> b  
      <div class="col-lg-3 col-md-6">
         <div class="card" style="width: 18rem;">
            <img
               src="./img01/02.jpg"
               class="card-img-top" alt="노트북 이미지">
            <div class="card-body">
               <h5 class="card-title">레노버 리전 Slim 5 16APH</h5>
               <p class="card-text">1,769,890원</p>
               <a href="#" class="btn btn-primary">아이템 상세 보기</a>
            </div>
         </div>
      </div>
      <div class="col-lg-3 col-md-6">
         <div class="card" style="width: 18rem;">
            <img
               src="./img01/03.jpg"
               class="card-img-top" alt="노트북 이미지">
            <div class="card-body">
               <h5 class="card-title">디클 클릭북 D14 프로 ( N4120 ) 노트북</h5>
               <p class="card-text">368,500원</p>
               <a href="#" class="btn btn-primary">아이템 상세 보기</a>
            </div>
         </div>
      </div>
      <div class="col-lg-3 col-md-6">
         <div class="card" style="width: 18rem;">
            <img
               src="./img01/04.jpg" class="card-img-top" alt="노트북 이미지">
            <div class="card-body">
               <h5 class="card-title">HP 2023 14s 노트북 14</h5>
               <p class="card-text">657,990원</p>
               <a href="#" class="btn btn-primary">아이템 상세 보기</a>
            </div>
         </div>
      </div>      
   </div>
   <br/><br/>
   <div class="row">
      <div class="col-lg-3 col-md-6">
      <!-- Bootstrap Components의 Card 적용 -->
         <div class="card" style="width: 18rem;">
            <img src="./img02/05.jpg" class="card-img-top" alt="옷 이미지">
            <div class="card-body">
               <h5 class="card-title">ANYOU 프렌치 복고풍으로 날씬해 보이는 머메이드 느낌의 크루넥 A라인 원피스</h5>
               <p class="card-text">29,980원</p>
               <a href="#" class="btn btn-primary">아이템 상세 보기</a>
            </div>
         </div>
      </div>
      <div class="col-lg-3 col-md-6">
         <div class="card" style="width: 18rem;">
            <img src="./img02/06.jpg" class="card-img-top" alt="옷 이미지">
            <div class="card-body">
               <h5 class="card-title">담빛스토어 여름 오프숄더 U넥 퍼프소매 롱 원피스</h5>
               <p class="card-text">35,400원</p>
               <a href="#" class="btn btn-primary">아이템 상세 보기</a>
            </div>
         </div>
      </div>
      <div class="col-lg-3 col-md-6">
         <div class="card" style="width: 18rem;">
            <img src="./img02/07.jpg" class="card-img-top" alt="옷 이미지">
            <div class="card-body">
               <h5 class="card-title">ANYOU 여름원피스 슬림해 보임 반팔원피스 퍼프소매 원피스 숙녀 필수 브이넥 롱원피스</h5>
               <p class="card-text">19,990원</p>
               <a href="#" class="btn btn-primary">아이템 상세 보기</a>
            </div>
         </div>
      </div>
      <div class="col-lg-3 col-md-6">
         <div class="card" style="width: 18rem;">
            <img src="./img02/08.jpg" class="card-img-top" alt="옷 이미지">
            <div class="card-body">
               <h5 class="card-title">가비진 여성용 여름 시원한 스퀘어넥 오프숄더 엠보싱 스모크 쉬폰 롱 원피스</h5>
               <p class="card-text">21,900원</p>
               <a href="#" class="btn btn-primary">아이템 상세 보기</a>
            </div>
         </div>
      </div>
   </div>
   <br/><br/>
   <div class="row">
      <div class="col-lg-3 col-md-6">
      <!-- Bootstrap Components의 Card 적용 -->
         <div class="card" style="width: 18rem;">
            <img src="./img03/09.jpg" class="card-img-top" alt="잡화 이미지">
            <div class="card-body">
               <h5 class="card-title">센카 퍼펙트 휩 프레시 클렌징 폼</h5>
               <p class="card-text">18,430원</p>
               <a href="#" class="btn btn-primary">아이템 상세 보기</a>
            </div>
         </div>
      </div>
      <div class="col-lg-3 col-md-6">
         <div class="card" style="width: 18rem;">
            <img src="./img03/10.jpg" class="card-img-top" alt="잡화 이미지">
            <div class="card-body">
               <h5 class="card-title">키오스킨 보톡스 멀티밤</h5>
               <p class="card-text">39,900원</p>
               <a href="#" class="btn btn-primary">아이템 상세 보기</a>
            </div>
         </div>
      </div>
      <div class="col-lg-3 col-md-6">
         <div class="card" style="width: 18rem;">
            <img src="./img03/11.jpg" class="card-img-top" alt="잡화 이미지">
            <div class="card-body">
               <h5 class="card-title">달바 화이트 트러플 수프림 인텐시브 세럼 100ml x 2p + 50ml x 2p + 클렌저 15ml 세트</h5>
               <p class="card-text">35,360원</p>
               <a href="#" class="btn btn-primary">아이템 상세 보기</a>
            </div>
         </div>
      </div>
      <div class="col-lg-3 col-md-6">
         <div class="card" style="width: 18rem;">
            <img src="./img03/12.jpg" class="card-img-top" alt="잡화 이미지">
            <div class="card-body">
               <h5 class="card-title">라운드랩 독도 토너</h5>
               <p class="card-text">18,060원</p>
               <a href="#" class="btn btn-primary">아이템 상세 보기</a>
            </div>
         </div>
      </div>
   </div>
</body>
</html>