<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<title>Insert title here</title>
<style>
.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.addrtest1 {
	width: 400px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<h1>이력서</h1>
	<hr>
	<div class="container">
		<div>
			<c:if test="${sessionScope.scategory=='기업'}">
				<c:if test="${offCount==0}">
					<button class="btn btn-danger btn-icon-split btn-lg col-4 "
						data-bs-toggle="modal" data-bs-target="#exampleModal">
						<span class="icon text-white-50"> <i
							class="bi bi-clipboard-heart"></i>
						</span> <span class="text">제안보내기</span>
					</button>
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel">제안보내기</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form>
										<div class="mb-3 row">
											<label for="resume_info" class="col-form-label">이력서작성자정보</label>
											<label for="resume_info" class="col-sm-2 col-form-label">작성자</label>
											<div class="col-sm-10">
												<input type="text" readonly class="form-control-plaintext"
													id="resume_info" value="${dto.name}">
											</div>
											<label for="resume_info1" class="col-sm-2 col-form-label">성별</label>
											<div class="col-sm-10">
												<input type="text" readonly class="form-control-plaintext"
													id="resume_info1" value="${dto.gender}">
											</div>
											<label for="resume_info2" class="col-sm-2 col-form-label">나이</label>
											<div class="col-sm-10">
												<input type="text" readonly class="form-control-plaintext"
													id="resume_info2" value="${dto.age}">
											</div>
										</div>
										<div class="mb-3">
											<label for="comNotice" class="col-form-label">내 공고
												리스트</label><input type="hidden" id="norIdx"
												value="${dto.member_idx}"><input type="hidden"
												id="com_idx" value="${sessionScope.sidx}"> <input
												type="hidden" id="noticeIdx"><input type="hidden"
												id="noticeSubject"><input type="hidden"
												id="normal_birth" value="${normaldto.birth}">
											<div id="noticeList"></div>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary"
										onclick="offerSubmit()">보내기</button>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${offCount!=0}">
					<button class="btn btn-danger btn-icon-split btn-lg col-4" disabled>
						<span class="icon text-white-50"> <i
							class="bi bi-clipboard-heart"></i>
						</span> <span class="text">이미 제안을 보낸 이력서입니다.</span>
					</button>
				</c:if>
			</c:if>
			<script>
				$(document).ready(
						function() {
							$.ajax({
								url : "comNoticeSubject.do",
								method : "POST",
								data : {
									idx : $("#com_idx").val()
								},
								success : function(data) {
									var select = $("<select>").addClass(
											"form-control").attr("id",
											"comNotice");
									var defaultOption = $("<option>").val("")
											.text("공고를 선택해주세요.").attr(
													"selected", true);
									select.append(defaultOption);
									for (var i = 0; i < data.length; i++) {
										if (data[i] && data[i].subject) {
											var option = $("<option>").val(
													data[i].idx).text(
													data[i].subject);
											select.append(option);
										}
									}
									$("#noticeList").append(select);
									$("#noticeList select").on(
											"change",
											function() {
												$("#noticeIdx").val(
														$(this).val());
												$("#noticeSubject").val(
														$(this).find(
																":selected")
																.text());
											});
								}
							});
						});
				function offerSubmit() {
					$.ajax({
						url : "offerSubmit.do",
						method : "POST",
						data : {
							notice_idx : $("#noticeIdx").val(),
							normal_idx : $("#norIdx").val(),
							com_idx : $("#com_idx").val(),
							normal_name : $("#resume_info").val(),
							notice_subject : $("#noticeSubject").val(),
							normal_gender : $("#resume_info1").val(),
							normal_birth : $("#normal_birth").val()
						},
						success : function(data) {
							if (data === 0) {
								alert('실패');
							} else if (data === 1) {
								alert('전송완료');
								location.reload(); // reload the page
							}
						}
					});
				}
			</script>
			<div class="my-4"></div>
			<div class="card bg-primary bg-opacity-10 col-6 offset-3">
				<div class="card-body">
					<table>
						<c:if test="${empty dto }">
							<tr>
								<th></th>
								<td>등록된 정보가 없습니다</td>
							</tr>
						</c:if>
						<tr>
							<th>이름 / 성별 / 나이</th>
							<td></td>
						</tr>
						<tr>
							<th>${dto.name}/${dto.gender}/${dto.age}</th>
							<td></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><span>${dto.addr } ${dto.detail_addr }</span></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${dto.email }</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${dto.tel }</td>
						</tr>
						<tr>

							<th>이력서제목</th>
							<td>${dto.subject }</td>
						</tr>
						<tr>
							<th>학력</th>
							<td>${dto.grade }</td>
						</tr>

					</table>
				</div>
			</div>
		</div>


		<h2>경력사항</h2>
		<div class="my-4"></div>
		<div class="card bg-primary bg-opacity-10 col-6 offset-3">
			<div class="card-body">
				<table>

					<tr>
						<th>경력구분</th>
						<td><h6>&nbsp; &nbsp;${dto.career_check }</h6></td>
					</tr>
					<tr>
						<th></th>
						<td><div id="carrer1">
								<c:choose>
									<c:when test="${dto.career_check == '신입' }"></c:when>
									<c:otherwise>
										<c:forEach var="list" items="${list }">
											<table>
												<tr>
													<th>회사명</th>
													<td>${list.com_name }</td>
												</tr>
												<tr>
													<th>근무기간</th>
													<td><span>${list.startday } </span> ~ <span>${list.endday }</span></td>
												</tr>
												<tr>
													<th>담당업무</th>
													<td>${list.part }</td>
												<tr>
												<tr>
													<th>서비스타입</th>
													<td>${list.service_type }</td>
												<tr>
											</table>
											<hr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div></td>
					</tr>
				</table>
			</div>
		</div>
		<h2>희망근무조건</h2>
		<div class="my-4"></div>
		<div class="card bg-primary bg-opacity-10 col-6 offset-3">
			<div class="card-body">
				<table>

					<tr>
						<th>희망 근무지</th>
						<td>${dto.h_local1 }${dto.h_local2 }</td>
					</tr>
					<tr>
						<th>직종</th>
						<td>${dto.job }</td>
					</tr>
					<tr>
						<th>근무기간</th>
						<td>${dto.h_period }</td>
					</tr>
					<tr>
						<th>근무요일</th>
						<td>${yy }</td>
					</tr>

					<tr>
						<th>희망하는 근무시간</th>
						<td>${dto.h_worktime }</td>
					</tr>
					<tr>
						<th>급여종류</th>
						<td>${dto.h_pay}</td>
					</tr>
					<tr>
						<th>급여</th>
						<td>${dto.h_pay_category}</td>
					</tr>
				</table>
			</div>
		</div>

		<div>
			<h2>자기소개서</h2>
			<div class="my-4"></div>
			<div class="card bg-primary bg-opacity-10 col-6 offset-3">
				<div class="card-body">
					<textarea rows="30" cols="50" name="content" readonly
						style="resize: none">${dto.content }</textarea>
				</div>
			</div>
			<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>