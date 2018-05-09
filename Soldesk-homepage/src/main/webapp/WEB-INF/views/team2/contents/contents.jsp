<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CONTENTS_PAGE</title>
<style type="text/css">
.modS, .modE, .mod {
	/* 
		none : �Ⱥ��̰�, �ڸ� ���������� �ʰ� 
		block : ���̰�, ���� �� �����ϰ�
		inline : ���̰�, ���� �� ���� ������ �ʰ� 
	*/
	display: none;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#mod").click(function() {
			if ($("#mod").attr("value") == "off") {
				$(".modS, .mod, .modSubS").css("display", "inline");
				$("#mod").attr("value", "on");
			} else {
				$(".modS, .modE, .mod, .modSubS, .modSubE").css("display", "none");
				$(".main, .subMain").css("display", "inline");
				$("#mod").attr("value", "off");
			}
		});
		$("#modTitleS").click(function() {
			$("#modTitleS").css("display", "none");
			$("#title").css("display", "none");
			$("#modTitle").css("display", "inline");
			$("#modTitleE").css("display", "inline");
		});
		$("#modTitleE").click(function() {
			$("#modTitleE").css("display", "none");
			$("#modTitle").css("display", "none");
			$("#title").css("display", "inline");
			$("#modTitleS").css("display", "inline");
		});
		$("#modSchedule1S").click(function() {
			$("#modSchedule1S").css("display", "none");
			$("#schedule1").css("display", "none");
			$("#modSchedule1").css("display", "inline");
			$("#modSchedule1E").css("display", "inline");
		});
		$("#modSchedule1E").click(function() {
			$("#modSchedule1E").css("display", "none");
			$("#modSchedule1").css("display", "none");
			$("#schedule1").css("display", "inline");
			$("#modSchedule1S").css("display", "inline");
		});
		$("#modTimeS").click(function() {
			$("#modTimeS").css("display", "none");
			$("#time").css("display", "none");
			$("#modTime").css("display", "inline");
			$("#modTimeE").css("display", "inline");
		});
		$("#modTimeE").click(function() {
			$("#modTimeE").css("display", "none");
			$("#modTime").css("display", "none");
			$("#time").css("display", "inline");
			$("#modTimeS").css("display", "inline");
		});
		$("#modCapacityS").click(function() {
			$("#modCapacityS").css("display", "none");
			$("#capacity").css("display", "none");
			$("#modCapacity").css("display", "inline");
			$("#modCapacityE").css("display", "inline");
		});
		$("#modCapacityE").click(function() {
			$("#modCapacityE").css("display", "none");
			$("#modCapacity").css("display", "none");
			$("#capacity").css("display", "inline");
			$("#modCapacityS").css("display", "inline");
		});
	});
</script>
</head>
<body>
	<table border="solid">
		<tr>
			<td>
				<button id="mod" value="off">�����ڸ�� on/off</button>
			</td>
		</tr>
		<tr>
			<td><h1>
					<span id="title" class="main">${c.sc_title }</span> <input
						id="modTitle" class="modE" value="${c.sc_title }">
					<button id="modTitleS" class="modS">����</button>
					<button id="modTitleE" class="modE">�Ϸ�</button>
				</h1></td>
		</tr>
		<tr>
			<td><h5>
					��з�
					<!-- ${category } -->
					> �ߺз�
					<!-- ${category } -->
					> ${c.sc_title }
				</h5></td>
		</tr>
		<tr>
			<td>
				<table border="solid">
					<tr>
						<td>
							<h3>
								��������
								<button id="modSchedule1S" class="modS">����</button>
								<button id="modSchedule1E" class="modE">�Ϸ�</button>
							</h3>
						</td>
						<td><span id="schedule1" class="main"> <fmt:formatDate
									value="${c.sc_schedule_start }" pattern="yyyy.MM.dd" /> ~ <fmt:formatDate
									value="${c.sc_schedule_finish }" pattern="yyyy.MM.dd" />
						</span> <span id="modSchedule1" class="modE"> <input value="">~<input
								value="">
						</span></td>
						<td>
							<h3>�����Ⱓ</h3>
						</td>
						<td>${totalMonth }����,��${totalHours }�ð�</td>
					</tr>
					<tr>
						<td>
							<h3>
								�����ð�
								<button id="modTimeS" class="modS">����</button>
								<button id="modTimeE" class="modE">�Ϸ�</button>
							</h3>
						</td>
						<td>�� �� <span id="time" class="main">${totalWeeks }, <fmt:formatDate
									value="${c.sc_schedule_start }" pattern="kk:mm" /> ~ <fmt:formatDate
									value="${c.sc_schedule_finish }" pattern="kk:mm" />
						</span><span id="modTime" class="modE"><input
								value="${totalWeeks }">, <input value="">~<input
								value=""> </span></td>
						<td>
							<h3>
								��������
								<button id="modCapacityS" class="modS">����</button>
								<button id="modCapacityE" class="modE">�Ϸ�</button>
							</h3>
						</td>
						<td><span id="capacity" class="main">${c.sc_capacity }</span><span
							id="modCapacity" class="modE"> <input
								value="${c.sc_capacity }">
						</span>��</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table border="solid">
					<tr>
						<td>�����Ұ�</td>
						<td><button>������û</button></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><jsp:include page="substance.jsp"></jsp:include></td>
		</tr>
		<tr>
			<td>
				<button>����</button>(onclick���� ����ȭ������ ���ư���)
			</td>
		</tr>
	</table>
</body>
</html>