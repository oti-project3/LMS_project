<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board" />

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="<c:url value='/js/board.js'/>"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- CSS 적용 -->
<style>
  @import url('https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&display=swap');
  .card-title {
  	font-family: 'Gowun Batang', serif;
  }
 
 #carouselExampleIndicatorsBg {
	z-index: 2;
	background-image: url("../img/login.png");
	background-size: cover;
	opacity: 0.3;
 }
 
 #carouselExampleIndicators {
 	top: -450px;
 }
</style>

<body>
	<div class="wrapper ">
		<jsp:include page="/WEB-INF/views/include/list.jsp" />
		    <div class="main-panel" id="main-panel">
		      	<!-- 캐러셀 -->
		      	<div id="carouselExampleIndicatorsBg" style="height: 450px;"></div>
		      	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
					  <ol class="carousel-indicators">
					    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					  </ol>
					  <div class="carousel-inner d-flex">
					    <div class="carousel-item active">
					    	<div class="d-flex justify-content-center">
					    		<div class="h4 mt-5 mx-5 font-wieght-bold">
					    			Young Song Story
					    			<hr>
					    			<div class="h6 text-muted">영송대학교의 생생한 <br> 소식을 발빠르게 전해드립니다.</div>
					    		</div>
						       <img class="d-block w-25 mx-5" src="<c:url value='/img/car1.jpg'/>" alt="First slide" style="border-radius: 30px;">
							   <img class="d-block w-25 mx-5" src="<c:url value='/img/car2.jpg'/>" alt="First slide" style="border-radius: 30px;">
					    	</div>
					    </div>
					    <div class="carousel-item">
					    	<div class="d-flex justify-content-center">
					    		<div class="h4 mt-5 mx-5 font-wieght-bold">
					    			Young Song Story
					    			<hr>
					    			<div class="h6 text-muted">영송대학교의 생생한 <br> 소식을 발빠르게 전해드립니다.</div>
					    	 </div>
						     <img class="d-block w-25 mx-5" src="<c:url value='/img/car3.jpg'/>" alt="Second slide" style="border-radius: 30px;">
						     <img class="d-block w-25 mx-5" src="<c:url value='/img/car4.jpg'/>" alt="Second slide" style="border-radius: 30px;">
					    	</div>
					    </div>
					    <div class="carousel-item">
					    	<div class="d-flex justify-content-center">
					    		<div class="h4 mt-5 mx-5 font-wieght-bold">
					    			Young Song Story
					    			<hr>
					    			<div class="h6 text-muted">영송대학교의 생생한 <br> 소식을 발빠르게 전해드립니다.</div>
					    	 </div>
					     	 <img class="d-block w-25 mx-5" src="<c:url value='/img/car5.jpg'/>" alt="Third slide" style="border-radius: 30px;">
					     	 <img class="d-block w-25 mx-5" src="<c:url value='/img/car6.jpg'/>" alt="Third slide" style="border-radius: 30px;">
					    	</div>
					    </div>
					  </div>
					  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
				</div>
		      	<!-- 내용  -->
		      	<div class="content" style="padding-bottom: 110px;">
			        <div class="row">
			          <div class="col-md-12">
			            <div class="card" style="top:-300px;">
			              <div class="card-header d-flex justify-content-left align-items-center">
			                <span class="card-title mt-4 ml-4 h2 mr-0 pr-0"><strong>지금 영송대학교에서는</strong></span>
			                <span class="ml-3" style="width:70%; height:20px; border-top: 2px solid black;"></span>
			              </div>
			              <div class="card-body">
		              		<!-- 뉴스 -->
			              	<div class="d-flex flex-row justify-content-evenly">
			              		<div class="card col-3"  style="border-radius: 20px; background-color: #F8F4EA; box-shadow: 0px 5px 6px 0px rgb(31 41 55 / 14%);">
			              			<div class="card-header font-weight-bold text-primary" style="font-size: 20px;">
			              				news
			              				<hr>
			              				<img src="<c:url value='/img/news1.jpg'/>">
		              				</div>
			              			<div class="card-body">
			              				<h5>생각에 생각을 쌓다, 〈허물고 다시 쌓기〉 전시</h5>
			              				<div class="text-muted" style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden">
			              					연말이면 서울대학교 관악 캠퍼스에서는 학생들이<br>그동안 갈고닦은 솜씨를 선보이는 문화 행사가 곳곳에서 펼쳐진다. 교내 동아리 연습실과 학생회관 라운지, 두레문예관, 관악사 가온홀 무대는 힙합, 춤, 밴드 공연으로 빌 틈이 없다. 지난 12월 13일(화)부터 16일(금)까지 73동 문화관 1층에서는 〈LAYERS: 허물고 다시 쌓기〉 전시가 열렸다. 이번 행사는 미술대학 미술경영 협동과정에 개설된 ‘작품발표’ 수업 수강생들이 결과물을 선보이는 자리였다. 교수, 학생 작가, 기획자가 의견을 나누고 생각을 더해 완성한 전시는 관람객이 세상을 보는 새로운 시각을 갖게 했다.
			              				</div>
			              			</div>
			              		</div>
			              		<div class="card col-3"  style="border-radius: 20px; background-color: #F8F4EA; box-shadow: 0px 5px 6px 0px rgb(31 41 55 / 14%);">
			              			<div class="card-header font-weight-bold text-primary" style="font-size: 20px;">
			              				news
			              				<hr>
			              				<img src="<c:url value='/img/news2.jpg'/>">
		              				</div>
			              			<div class="card-body">
			              				<h5>3년 만에 돌아온 서울대학교 종합체육대회</h5>
			              				<div class="text-muted" style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden">
			              					지난 10월 24일(월)부터 11월 25일(금)까지 서울대학교 <br> 종합체육대회가 열렸다. 서울대 스포츠진흥원과 축구부, 농구부, 야구부, 핸드볼부, 테니스부, 육상부 등 6개 운동부가 주관하는 행사다. ▲축구 ▲농구 ▲야구 ▲풋살 ▲테니스 ▲100m 개인 단거리 ▲400m 단체 계주 등 일곱 종목이 종합운동장, 보조운동장, 71동 종합체육관, 71-1동 다목적체육관, 풋살장, 본부 테니스장에서 개최됐다.
			              				</div>
			              			</div>
			              		</div>
			              		<div class="card col-3"  style="border-radius: 20px; background-color: #F8F4EA; box-shadow: 0px 5px 6px 0px rgb(31 41 55 / 14%);">
			              			<div class="card-header font-weight-bold text-primary" style="font-size: 20px;">
			              				news
			              				<hr>
			              				<img src="<c:url value='/img/news3.jpg'/>">
		              				</div>
			              			<div class="card-body">
			              				<h5>20개월 만에 다시 돌아온 캠퍼스의 중심, “잔디광장”</h5>
			              				<div class="text-muted" style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden">
			              					12월 14일(수) 행정관 앞 잔디광장이 공식적으로 개장했다. <br>서울대학교는 기존 잔디광장 지하에 지하 2층 규모의 주차장을 건설하고, 잔디광장을 새롭게 조성하고자 작년 4월부터 약 20개월간 공사를 진행했다. 공식 개장에 앞서 서울대는 “행정관 앞 잔디광장 이름짓기 공모전”을 진행했고, 12월 14일 진행된 현장 투표 결과 “잔디광장”이 최종 명칭으로 결정됐다.
			              				</div>
			              			</div>
			              		</div>
			              </div>
			              <!-- 인터뷰 -->
			              <div class="d-flex flex-row justify-content-evenly mt-3">
			              	<div class="card col-3"  style="border-radius: 20px; background-color: #F8F4EA; box-shadow: 0px 5px 6px 0px rgb(31 41 55 / 14%);">
		              			<div class="card-header font-weight-bold text-primary" style="font-size: 20px;">
		              				Interview
		              				<hr>
		              				<img src="<c:url value='/img/news4.jpg'/>">
	              				</div>
		              			<div class="card-body">
		              				<h5>세상을 바꾸는 소설의 힘 - 〈파친코〉 이민진 작가와의 대화</h5>
		              				<div class="text-muted" style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden">
		              					11월 22일(화) 오후 3시부터 5시까지 서울대학교 <br> 미술관 오디토리엄에서 소설 『파친코(Pachinko)』의 저자 이민진(MinJin Lee) 작가와의 대화가 진행됐다. 이번 행사는 정치외교학부 SNU 10-10 사업단의 주관으로 진행됐으며, 정치외교학부 송지우 교수가 사회를 맡았다. 1부에서는 정치외교학부 교수진들과 학생들이 사전 제출한 질문들을 바탕으로 한 대화가 진행됐고, 2부에서는 현장에 참여한 서울대학교 구성원들과의 질의응답이 이루어졌다.
		              				</div>
		              			</div>
		              		</div>
			              	<div class="card col-3"  style="border-radius: 20px; background-color: #F8F4EA; box-shadow: 0px 5px 6px 0px rgb(31 41 55 / 14%);">
		              			<div class="card-header font-weight-bold text-primary" style="font-size: 20px;">
		              				Interview
		              				<hr>
		              				<img src="<c:url value='/img/news5.jpg'/>">
	              				</div>
		              			<div class="card-body">
		              				<h5>[샤로잡다] 한반도를 덮친 기후위기, 블루카본 갯벌에 주목해야할 이유?</h5>
		              				<div class="text-muted" style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden">
		              					김종성 교수가 들려주는 향후 한반도에 다가올 기후위기 <br> 기후위기에 놓은 한반도는 과연 안전할까? 이를 해결하기 위해서
		              				</div>
		              			</div>
		              		</div>
			              	<div class="card col-3"  style="border-radius: 20px; background-color: #F8F4EA; box-shadow: 0px 5px 6px 0px rgb(31 41 55 / 14%);">
		              			<div class="card-header font-weight-bold text-primary" style="font-size: 20px;">
		              				Art
		              				<hr>
		              				<img src="<c:url value='/img/news6.jpg'/>">
	              				</div>
		              			<div class="card-body">
		              				<h5>무엇이든 예술이 되고 누구든지 문화를 즐기는 곳, 영송대 문화예술원</h5>
		              				<div class="text-muted" style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden">
		              					전력과 난방을 공급하던 파워플랜트가 학교와 사회에 ‘문화 에너지’를 <br> 불어넣는 펌프로 변신한다. 파워플랜트는 문화관(73동) 리모델링으로 탄생할 ‘뉴하우스’와 함께 서울대학교 문화예술원 사업이 이뤄지는 핵심 공간이 될 예정이다. 올해 7월 개원한 문화예술원은 지난 9월 26일(월)부터 28일(수)까지 제1파워플랜트(68동)에서 첫 행사 ’파워플랜트, 극장이 되다’를 개최했다.
		              				</div>
		              			</div>
		              		</div>
			              </div>
			            </div>
			          </div>
			        </div>
			      </div>
			      <jsp:include page="/WEB-INF/views/include/footer.jsp" />
		    </div>
	</div>
</div>
</body>
</html>