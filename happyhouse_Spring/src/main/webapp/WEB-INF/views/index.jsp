<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="/WEB-INF/views/head/indexhead.jsp" %>
<title>happyhouse</title>
<script type="text/javascript">
$(document).ready(function(){
    $.ajax({
        url : "/board/mostsearch",
        type : "GET",
        contentType:'application/json;charset=utf-8',
        dataType:'json',
        success:function(lists) {
           makeList(lists);
        },
        error:function(xhr, status, error){
            console.log("상태값 : " + xhr.status + "\tHttp 에러메시지 : " + xhr.responseText);
        }
    });

});

function makeList(lists){
    $("#boardlistbody").empty();
    $(lists.boardlist).each(function(index, list) {
        if(index >= 0 && index<=2){
            let str = `<tr id="" class="">
                <td>${'${list.no}'}</td>
                <td>${'${list.subject}'}</td>
                <td>${'${list.search}'}</td>
            </tr>`;
             $("#boardlistbody").append(str);
        }
    });
}
</script>

</head>
<body>

	<!-- HEADER 시작 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	<!-- HEADER 끝 -->

	<!-- MAIN 시작 -->
	<div id="main" class="container">
		<!-- BANNER 시작 -->
		<jsp:include page="/WEB-INF/views/template/banner.jsp"></jsp:include>
		<!-- BANNER 끝 -->

		<div class="pt-3 row">
			<div class="col-8">
				<div id="location-search" class="mb-2">
					<div class="select-box">
						<!-- <form action="/search" method="post"> -->
							<!-- 도/광력시 dropdown -->
							<div class="row">
								<select class="col border m-2" id="sido" name="sido">
									<option value="">도/광역시</option>
								</select>
								<!-- 시/구/군 dropdown -->
								<select class="col border m-2" id="gugun" name="gugun">
									<option value="">시/군/구</option>
								</select>

								<!-- 동 dropdown -->
								<select class="col border m-2" id="dong" name="dong">
									<option value="">동</option>
								</select>
								<!-- search-btn 시작 -->
								<button type="button" class="col btn btn-secondary"
									id="search-btn">검색</button>
								<!-- search-btn 끝 -->
							</div>
						<!-- </form> -->
					</div>
				</div>
				<!-- MAP 시작 -->
				<div id="map"></div>
				<!-- MAP 끝 -->
			</div>

			<!-- 주택 list 시작-->
			<div id="location-list " class="col-4">
				<div class="row searchaddress" id="searchlocation">
					<h5 class="text-center pt-2">검색 지역 : 없음</h5>
				</div>
				<div class="border p-2">
					<div class="row">
						<div id="apt-search">
							<!-- <form class="form-inline" id="word-form" action="search.do"> -->
								<input type="hidden" name="pg" value="1">
								<select class="col border m-2" style="height: 40px;" name="key">
									<option value="aptName">아파트이름
								</select> <input type="text" class="col ml-1 form-control" name="word">
								<button type="button" class="col btn btn-outline-primary"
									id="word-btn">검색</button>
							<!-- </form> -->
						</div>
					</div>

					<div id="apt-list">
						<h4 class="text-center mt-5">검색 키워드로 검색해주세요</h4>
					</div>
					<div id="apt-page"></div>
					
				</div>
				<!-- 주택 list 끝-->
			</div>
			<!-- map-contetns 끝 -->

			<!-- info-contents 시작 -->
			<div class="row mt-2 infocontents">
				<div class="col m-2 p-3 border">
					<img src="./img/adimg.jpg" class="d-block w-100" alt="광고입니다" />
				</div>
				<div class="col m-2 p-3 border text-center">
					<h5>게시판</h5>
					<hr>
					<table class="table table-hover">
                        <thead>
                            <tr>
                                <th>글 번호</th>
                                <th>제목</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody id="boardlistbody">
                        </tbody>
                    </table>
                    <a href="board/listboardform" style="float: right; text-decoration: none">더보기</a>
				</div>
				<h5 class="col m-2 p-3 border text-center">오늘의 뉴스</h5>
				<hr>
			</div>
			<!-- info-contens 끝 -->
		</div>
	</div>
	<!-- MAIN 끝 -->


	<!-- FOOTER 시작 -->
	<footer class="p-3 bg-dark text-white container">
		<img src="/img/SSAFY.jpg" />
		<p>Find Us</p>
		<hr />
		<p>(SSAFY)서울시 강남구 테헤란로 멀티스퀘어</p>
		<p>1544-9001</p>
	</footer>
	<!-- FOOTER 끝 -->
</body>
</body>
</html>
