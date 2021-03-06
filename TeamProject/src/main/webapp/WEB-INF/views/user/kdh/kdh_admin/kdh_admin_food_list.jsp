<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
</head>
<!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/css/admin.css">
<style>
	.food_title:hover {
		color:red;
	}
.page-item {
	float:left;
}
.page-link {
	width:30px;
	float:left;
}
</style>
<script>
$(function() {
	
	$("#food_product_manage > dd").css("display","block");
	$("#food_product_manage > dt").css("color","red");
	$("#food_product_manage > dd").eq(0).css("color","blue");
	
	// 페이지 버튼 클릭시 해당 페이지 넘어가게
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		$("#adminForm > input[name=page]").val(page);
		console.log("page:" + page);
		$("#adminForm").submit();
	});
	
	// 현재 페이지 액티브 설정
	$("a.page-link").each(function() {
		var page = $(this).attr("href");
		if (page == "${pagingDto.page}") {
			$(this).parent().addClass("active");
			return;
		}
	});
	
	// 검색 버튼
	$("#btnSearch").click(function() {
		var searchType = $("#searchSelect").val();
		var keyword = $("#keyword").val();
		console.log("searchType:" + searchType);
		console.log("keyword:" + keyword);
		$("#adminForm > input[name=searchType]").val(searchType);
		$("#adminForm > input[name=perPage]").val(10);
		$("#adminForm > input[name=keyword]").val(keyword);
		$("#adminForm").submit();
	});
	
	$("#searchSelect").change(function() {
		var selected = $("#searchSelect option:selected").val();
		if (selected == "all") {
			$("#keyword").css("display", "none");
		}
	});
	
});
</script>

<body class="js">
<%@ include file="../../../user/jmh/include/formPage.jsp" %>
<!-- 해더 부분 -->
<%@include file="../../../include/admin_header.jsp" %>

<!-- 폼 전송 -->
<form id="adminForm" action="/kdh/admin/admin_food_list" method="get">
	<input type="hidden" name="page" value="${pagingDto.page}"/>
	<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${pagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${pagingDto.keyword}"/>
</form>

		<!-- admin_category -->
		<section class="product-area shop-sidebar shop section" style="padding-top:10px;">
			<div class="container" style="padding:0px;">
				<div class="row">
				<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
								<div style="background-color:#f6f7fb; padding:20px; border-bottom:1px solid #ddd;">
									<h4 class="title" >푸드 상품관리_상품조회(스토어)</h4>
								</div>	
								<!--  검색 -->
								<div style="padding:20px;text-align:right;">
										
									<div class="single-shorter" style="vertical-align:middle;">
											<label>검색 :</label>
											<select id="searchSelect" name=searchType>
												<option value="all"
												<c:if test="${pagingDto.searchType == 'all'}">selected</c:if>
												>전체</option>
												<option value="100"
												<c:if test="${pagingDto.searchType == '100'}">selected</c:if>
												>스낵</option>
												<option value="200"
												<c:if test="${pagingDto.searchType == '200'}">selected</c:if>
												>음료</option>
												<option value="300"
												<c:if test="${pagingDto.searchType == '300'}">selected</c:if>
												>패키지</option>
											</select>
										</div>

									<input type="text" id="keyword" value=""/>
									<button type="button" class="btn" id="btnSearch">검색</button>
								</div>	
								<!--  검색 끝 -->
								<!--  페이지별 내용 -->
								<table class="table" style="text-align:center;height:auto;" id="movie_table">
									<thead>
										<tr>
											<th style="width:100px;">상품이미지</th>
											<th>상품명</th>
											<th style="width:100px;">상품금액</th>
											<th style="width:130px;">상품수량</th>
										</tr>
									</thead>
									<tbody style="vertical-align:middle;table-layout:fixed;">
								
									<!-- 상품(스토어) 조회 -->
									<c:forEach items="${listPageFoodlist}" var="foodVo">
										<tr style="height:50px;">
											<td><img src="/kdh/upload/displayFile?fileName=${foodVo.food_image}"/></td>
											<td style="vertical-align:middle;"><a href="/kdh/admin/admin_food_selectByFood?food_num=${foodVo.food_num}" class="food_title">${foodVo.food_name}</a></td>
											<td style="vertical-align:middle;"><fmt:formatNumber pattern="#,###,###" value="${foodVo.food_price}"></fmt:formatNumber>원</td>
											<td style="vertical-align:middle;">${foodVo.food_count}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row" style="height:100px;">
						</div>
						
						<!-- 페이징 -->
						<div class="row"  style="text-align:center;">
							<div class="col-md-12" style="padding-left: 400px;">
							<div class="col-md-9"></div>
								<div class="col-md-5 text-center" style="text-align:center;">
									<nav style="text-align:center;">
										<ul class="pagination text-center" style="text-align:center;">
										
										<!-- 이전 버튼 -->
										<c:if test ="${pagingDto.startPage != 1}">
											<li class="page-item" style="width:60px;"  style="float:left;">
										    	<a class="page-link" href="${pagingDto.startPage - 1}">이전</a>
											</li>
										</c:if>
						
									 	<!-- 페이징 넘버링 -->
									 	<c:forEach begin="${pagingDto.startPage}" end="${pagingDto.endPage}" var="v">
										    <li id="pageNumber" class="page-item"  style="width:30px; float:left;">
										    	<a class="page-link" href="${v}">${v}</a>
										    </li>
										</c:forEach>    	
										
										<!-- 다음 버튼 -->
										  <c:if test="${pagingDto.endPage < pagingDto.totalPage}">
										    <li class="page-item" style="width:60px; float:left;">
										    	<a class="page-link" href="${pagingDto.endPage + 1}">다음</a>
										    </li>
										   </c:if>
										</ul>
									</nav>
								</div>
							</div>
							<div class="col-md-4"></div>
							<div class="col-md-12" style="margin-bottom: 100px;"></div>	
						</div>
						<!-- /페이징 -->
					</div>
				</div>
			</div>
		</section>
</body>
<%@ include file="../../../include/footer.jsp" %>
</html>