<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.modSubS, .modSubE, .mod {
	/* 
		none : �Ⱥ��̰�, �ڸ� ���������� �ʰ� 
		block : ���̰�, ���� �� �����ϰ�
		inline : ���̰�, ���� �� ���� ������ �ʰ� 
	*/
	display: none;
}
</style>
<script type="text/javascript">
	$(function() {
		$("button.modSubS").click(function(e) {
			var id = e.target.getAttribute('id');
			$("#" + id).css("display", "none");
			$("#" + id + "ST").css("display", "none");
			$("#" + (id * 1 + 100)).css("display", "inline");
			$("#" + (id * 1 + 100) + "ST").css("display", "inline");
		});
		$("button.modSubE").click(function(e) {
			var id = e.target.getAttribute('id');
			$("#" + id).css("display", "none");
			$("#" + id + "ST").css("display", "none");
			$("#" + (id * 1 - 100)).css("display", "inline");
			$("#" + (id * 1 - 100) + "ST").css("display", "inline");
		});
	});
</script>
</head>
<body>
	<table border="solid">
		<c:forEach var="s" items="${substance }">
			<tr>
				<td>
					<h3>
						<span id="${s.scs_order}ST" class="subMain"> ${s.scs_title }
						</span> <span id="${s.scs_order+100}ST" class="modSubE"> <input
							value="${s.scs_title }">
						</span>
						<button id="${s.scs_order }" class="modSubS">����</button>
						<button id="${s.scs_order+100}" class="modSubE">�Ϸ�</button>
					</h3>
				</td>
			</tr>
			<tr>
				<td><span id="${s.scs_order+200}ST" class="subMain"> <c:choose>
							<c:when test="${s.scs_info=='[[[����]]]' }">
								<jsp:include page="teacher.jsp"></jsp:include>
							</c:when>
							<c:otherwise>
								${s.scs_info }						
						</c:otherwise>
						</c:choose>
				</span> <textarea id="${s.scs_order+300}ST" class="modSubE" rows="" cols="">${s.scs_info }</textarea>
					<button id="${s.scs_order+200}" class="modSubS">����</button>
					<button id="${s.scs_order+300}" class="modSubE">�Ϸ�</button></td>
			</tr>
		</c:forEach>
		<tr>
			<td>
				<button class="mod">�߰�</button>
			</td>
		</tr>
	</table>
</body>
</html>