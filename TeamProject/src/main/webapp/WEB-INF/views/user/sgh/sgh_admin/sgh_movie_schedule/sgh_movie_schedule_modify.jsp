<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../../include/bootstrap.jsp" %>
<%@ include file="../../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../../include/admin_header.jsp" %>

<script>

$(function() {
	$("#movie_time_manage > dd").css("display","block");
	$("#movie_time_manage > dt").css("color","red");
	$("#movie_time_manage > dd").eq(0).css("color","blue");
	
	var result = "${result}";
	console.log("result :" + result);
	if(result == "false") {
		alert("등록에 실패하셨습니다 다시 확인해주세요.");
	}
	
	// 템플릿에서 나오는 select 막기
	$("select").css("display", "block");
	$(".nice-select").remove();
	
	// 시작일
	$("#movie_start_date").blur(function() {
		$(".start_clone").remove();
		var start_date = $(this).val();
		if(start_date == "" || start_date == null) {
			var span_clone = $("#message_span").clone();
			span_clone.attr("class", "start_clone");
			span_clone.text("시작일은 필수 입력 사항입니다.");
			$(this).after(span_clone);
			$("#start_date_result").val("false");
			return false;
		}
		$("#start_date_result").val("true");
	});
	
	// 종료일
	$("#movie_end_date").blur(function() {
		$(".end_clone").remove();
		var end_date = $(this).val();
		if(end_date == "" || end_date == null) {
			var span_clone = $("#message_span").clone();
			span_clone.attr("class", "end_clone");
			span_clone.text("종료일은 필수 입력 사항입니다.");
			$(this).after(span_clone);
			$("#start_date_result").val("false");
			return false;
		}
		$("#start_date_result").val("true");
	});
	
	// 전송할 때
	$("#frm_schedule").submit(function() {
		var start_result = $("#start_date_result").val();
		var end_result = $("#end_date_result").val();
		var movie_code = $("#movie_name option:selected").val();
		var theater_code = $("#theater_name option:selected").val();
		
		$("#movie_code").val(movie_code);
		$("#theater_code").val(theater_code);
		if(start_result == "false" || end_result == "false") {
			alert("비어있는 항목이 존재합니다. 다시 확인해주세요.");
			return false;
		}
	});
});
</script>
<!-- 해더 부분 -->
<div style="visibility: hidden;">
	<span id="message_span" style="color: red;"></span>
</div>
<section class="product-area shop-sidebar shop section" style="padding-top: 10px;">
	<div class="container" style="padding: 0px;">
		<div class="row">
			<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
						<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
							<h4 class="title">상영일 수정하기</h4>
						</div>
						<!--  페이지별 내용 -->
						<form id="frm_schedule" role="form" action="/sgh/admin/schedule/scheduleModifyRun" method="get">
							<input type="hidden" id="movie_code" name="movie_code">
							<input type="hidden" id="theater_code" name="theater_code">
							<input type="hidden" name="movie_schedule_code" value="${schedule_vo.movie_schedule_code}">
							<div class="form-group">
								<label for="movie_genre"><strong>등록된 영화</strong></label>
								<select id="movie_name">
									<c:forEach items="${schedule_list}" var="SghScheduleListDto">
										<option value="${SghScheduleListDto.movie_code}"
										<c:if test="${schedule_vo.movie_code == SghScheduleListDto.movie_code}">
											selected
										</c:if>
										>${SghScheduleListDto.movie_name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="movie_genre"><strong>등록된 영화관</strong></label>
								<select id="theater_name">
									<c:forEach items="${theater_list}" var="SghTheaterVo">
										<option value="${SghTheaterVo.theater_code}"
										<c:if test="${schedule_vo.theater_code == SghTheaterVo.theater_code}">
											selected
										</c:if>
										>${SghTheaterVo.theater_name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>시작일</strong></label>
								<input type="date" class="form-control" id="movie_start_date" name="movie_start_date" value="${schedule_vo.movie_start_date}"/>
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>종료일</strong></label>
								<input type="date" class="form-control" id="movie_end_date" name="movie_end_date" value="${schedule_vo.movie_end_date}"/>
							</div>
							<button type="submit" class="btn" id="btnSubmit">등록</button>
							<a href="/sgh/admin/schedule/scheduleList" class="btn" style="color: white;">취소</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../../../../include/footer.jsp" %>