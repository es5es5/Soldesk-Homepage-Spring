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
					대분류명
					<!-- ${smName } -->
					<button>수정</button>
				</h1></td>
		</tr>
		<tr>
			<td>
				<table border="solid">
					<tr>
						<td>전체</td>
						<c:forEach var="i" begin="1" end="3" step="1">
							<!-- ${ss } arrayList 받을거임 -->
							<td>
								<h4>
									분류
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
					대분류
					<!-- ${smName } -->
					> 중분류
					<!-- ${ssName } -->
					<button>수정</button>
					(현재 선택된 분류)
				</h3></td>
		</tr>
		<tr>
			<td>
				<table border="solid">
					<tr>
						<td>
							<h4>과정명</h4>
						</td>
						<td>
							<h4>교육비</h4>
						</td>
						<td>
							<h4>수강신청</h4>
						</td>
					</tr>
					<c:forEach var="c" items="${contents }">
						<tr>
							<td><a href="ContentsController?sc_no=${c.sc_no }">${c.sc_title }</a>
								<button>수정</button></td>
							<td>${c.sc_expense }
								<button>수정</button>
							</td>
							<td>
								<button>수강신청</button>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="3"><button>추가</button></td>
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