<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">

	<div class="progress col-md-12 m-2">
		<div class="progress-bar" style="width:  ${currentPosition}%"></div>
	</div>

	<!-- JSTL foreach문을 써서 뿌리세요. el표현식과 함께 -->
	<c:forEach var="user" items="${users}">
		<div class="card col-md-12 m-2">
			<div class="card-body d-flex justify-content-between">
				<table border="1" style="width: 90%">
					<tr>
						<td align="center">ID</td>
						<td align="center">이름</td>
						<td align="center">비밀번호</td>
						<td align="center">이메일</td>
						<td align="center">권한</td>
					</tr>

					<tr>
						<td align="center">${user.id}</td>
						<td align="center">${user.username}</td>
						<td align="center">${user.password }</td>
						<td align="center">${user.email}</td>
						<td align="center">${user.role}</td>
					</tr>
				</table>
				<div>
					<c:if test="${sessionScope.principal.id eq user.id}">
						<i onclick="deleteUser(${user.id})">삭제</i>
					</c:if>
				</div>
			</div>
		</div>
	</c:forEach>
	<br />
	<ul class="pagination justify-content-center">

		<c:choose>
			<c:when test="${param.page == 0}">
				<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/Test/user?cmd=list&page=${param.page-1}">Previous</a></li>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${lastPage == param.page}">
				<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/Test/user?cmd=list&page=${param.page+1}">Next</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>

</body>
</html>


