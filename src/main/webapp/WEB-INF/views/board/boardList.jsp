<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board" />

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<style>
  @import url('https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&display=swap');
  .card-header > h4 {
  	font-family: 'Gowun Batang', serif;
  }
  
  tr.colored:hover td{
  background-color:#FCB199!important;
  color:white!important;
}
</style>
<body>
	<div class="wrapper ">
		<jsp:include page="/WEB-INF/views/include/list.jsp" />
		<div class="main-panel" id="main-panel">
			<div class="panel-header panel-header-sm"></div>
			<div class="content" style="padding-bottom: 200px;">
				<div class="row">
					<div class="col-md-12">
						<div class="card" style="padding-bottom: 50px;">
							<div class="card-header d-flex flex-row justify-content-between align-items-baseline ml-4">
								 <h4 style="font-size: 45px;font-weight: 900;">커뮤니티</h4>
								<a class="btn btn-primary btn-lg" href="<c:url value='/board/insert'/>" style="border-radius: 30px">게시글 작성</a>
							</div>
							<div class="card-body ml-3">
								<div>
									<form action='<c:url value="/board/list/1"/>' method="get"
										class="form-inline">
										<div class="form-group mr-2 m-2">
											<label for="selectedCategory" class="mr-2" style="font-size: 20px;">카테고리</label> 
												<select name="selectedCategory" id="selectedCategory" class="form-control"  style="width:200px; height:50px;font-size:20px;">
												<option value="전체"
													<c:if test ="${selectedCategory eq '전체'}">selected="selected"</c:if>>전체</option>
												<option value="질문"
													<c:if test ="${selectedCategory eq '질문'}">selected="selected"</c:if>>질문</option>
												<option value="자유주제"
													<c:if test ="${selectedCategory eq '자유주제'}">selected="selected"</c:if>>자유주제</option>
												<option value="스터디"
													<c:if test="${selectedCategory eq '스터디'}">selected="selected"</c:if>>스터디</option>
											</select>
										</div>
										<div class="form-group mr-2 m-2">
											<label for="searchTitle" class="mr-2" style="font-size: 20px;">글 제목 </label> 
											<input type="text" name="searchTitle" id="searchTitle" value="${searchTitle}" class="form-control"  style="width:300px; height:50px;font-size:20px;" />
										</div>

										<div class="form-group mr-5 m-2">
											<label for="searchStudentId" class="mr-2" style="font-size: 20px;">작성자</label> 
											<input type="text" name="searchStudentId" id="searchStudentId" value="${searchStudentId}" class="form-control"  style="width:200px; height:50px;font-size:20px;"/>
										</div>

										<div class="form-group m-2 ">
											<input type="submit" value="검색" class="btn btn-primary btn-lg" style="border-radius: 30px;"/>
										</div>
									</form>
								</div>
								
								<!-- 테이블  -->
								<div class="table-responsive m-3 pr-4" style="font-size: 20px;text-align: center;">
									<table id="boardListTable" class="table">
										<thead class=" text-primary">
											<tr>
												<th style="width:150px;">BoardId</th>
												<th style="width:150px;">Category</th>
												<th style="width:1000px;">Title</th>
												<th>Writer</th>
												<th>Date</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${!empty boardList}">
											<c:forEach var="board" items="${boardList}">
												<tr class="colored" onclick='location.href="<c:url value='/board/detail/${board.boardId}'/>" '>
													<td>${board.boardId}</td>
													<td>${board.boardCategory}</td>
													<td>${board.boardTitle}</td>
													<td>${board.studentId}</td>
													<td>${board.calculateTime}</td>
												</tr>
											</c:forEach>
											</c:if>
											<c:if test="${empty boardList}">
												<tr>
													<td></td>
													<td></td>
													<td>작성된 게시글이 없습니다.</td>
													<td></td>
													<td></td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
							<c:if test="${!empty boardList}">
							<!-- Pagination -->
							<jsp:include page="/WEB-INF/views/paging/paginationBoard.jsp" />
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
	</div>
</body>
</html>