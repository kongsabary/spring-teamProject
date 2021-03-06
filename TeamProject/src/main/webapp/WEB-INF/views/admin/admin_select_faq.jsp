<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="utf-8">
<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
</head>
<!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<!--  admin.js -->
	<script src="/resources/js/admin.js"></script>
<link rel="stylesheet" href="/resources/css/admin.css">
<style>
	.movie_grade {
		margin-left:20px;
	}
	
	.movie_grade_span {
		margin-left:10px;
	}
	
	.fileLabel {
		width:80px;
		height:30px;
		border:1px solid #767676;
		border-top-right-radius:3px;
		border-top-left-radius:3px;
		border-bottom-left-radius:3px;
		border-bottom-right-radius:3px;
		text-align:center;
		background-color:#efefef;
		padding-top:2px;
	}

</style>
<script>
$(function () {
	$("#board_manage > dd").css("display","block");
	$("#board_manage > dt").css("color","red");
	$("#board_manage > dd").eq(2).css("color","blue");
	
	// 목록으로 가기
	$("#btnList").click(function () {
		location.href="/admin/admin_faq_list";
	});
	
	// 수정버튼 클릭했을 경우
	var index = 0;
	$("#btnModify").click(function (e) {
		e.preventDefault();
		if(index == 0) {
			alert("수정하신 후 수정완료 버튼을 클릭해주세요.");
			$("#faq_title").removeAttr("readonly")
			               .attr("required","required");
			$("#faq_content").removeAttr("readonly")
	        			   .attr("required","required");
			$(this).text("수정완료");
			index = 1;
		} else if(index == 1){
			$("#registForm").submit();
		}
		
		
	});
	
	// 삭제버튼 클릭했을 때
	$("#btnDelete").click(function (){
		var faq_code = "${jmhFAQVo.faq_code}";
		location.href="/admin/admin_delete_faq?faq_code="+ faq_code;
	}); 
});
</script>
<body class="js">
<!-- 해더 부분 -->
<%@include file="../include/admin_header.jsp" %>
		<!-- admin_category -->
		<section class="product-area shop-sidebar shop section" style="padding-top:10px;">
			<div class="container" style="padding:0px;">
				<div class="row">
				<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
								<div style="background-color:#f6f7fb; padding:20px; border-bottom:1px solid #ddd;margin-bottom:20px;">
									<h4 class="title" >게시판관리_FAQ 상세보기</h4>
								</div>	
								<!--  페이지별 내용 -->
								<form role="form" action="/admin/admin_modify_faq" method="post" id="registForm">
								<input type="hidden" name="faq_code" value="${jmhFAQVo.faq_code}"/>
									<div class="form-group">
										<label for="faq_title"><strong>FAQ 주제</strong></label>
										<input type=text class="form-control" id="faq_title" name="faq_title" value="${jmhFAQVo.faq_title}"readonly/>
									</div>
									<div class="form-group">
										<label for="faq_content"><strong>FAQ 내용</strong></label>
										<textarea rows="5" id="faq_content" name="faq_content" readonly>${jmhFAQVo.faq_content}</textarea>
									</div>
									<button type="submit" class="btn btn-primary" id="btnModify">수정</button>
									<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
									<button type="button" class="btn btn-primary" id="btnList">목록</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
<%@ include file="../include/footer.jsp" %>
</body>
</html>