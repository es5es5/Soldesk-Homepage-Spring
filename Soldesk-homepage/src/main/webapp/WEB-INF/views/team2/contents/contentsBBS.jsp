<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CONTENTS_BBS_PAGE</title>
<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/setImgSlider.js"></script>
<script src="js/setMenu.js"></script>
<script src="js/mainMenu.js"></script>
<script type="text/javascript">
	$(function() {
		setMainMenuAnimation();
		setMainSlider();
		setSiteSubMenu2();
	});
</script>
</head>
<body>
	<table border="solid">
		<tr>
			<td><h1>
					��з���
					<!-- ${smName } -->
					<button>����</button>
				</h1></td>
		</tr>
		<tr>
			<td>
				<table border="solid">
					<tr>
						<td>��ü</td>
						<c:forEach var="i" begin="1" end="3" step="1">
							<!-- ${ss } arrayList �������� -->
							<td>
								<h4>
									�з�
									<!-- ${ssName } -->
								</h4>
							</td>
						</c:forEach>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><h3>
					��з�
					<!-- ${smName } -->
					> �ߺз�
					<!-- ${ssName } -->
					<button>����</button>
					(���� ���õ� �з�)
				</h3></td>
		</tr>
		<tr>
			<td>
				<table border="solid">
					<tr>
						<td>
							<h4>������</h4>
						</td>
						<td>
							<h4>������</h4>
						</td>
						<td>
							<h4>������û</h4>
						</td>
					</tr>
					<c:forEach var="c" items="${contents }">
						<tr>
							<td><a href="ContentsController?sc_no=${c.sc_no }">${c.sc_title }</a>
								<button>����</button></td>
							<td>${c.sc_expense }
								<button>����</button>
							</td>
							<td>
								<button>������û</button>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="3"><button>�߰�</button></td>
					</tr>
					<tr>
						<td colspan="3"><c:forEach var="p" begin="1"
								end="${pageCount }">&nbsp;
							<a href="ContentsPageController?p=${p }">${p }</a>
							</c:forEach></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>