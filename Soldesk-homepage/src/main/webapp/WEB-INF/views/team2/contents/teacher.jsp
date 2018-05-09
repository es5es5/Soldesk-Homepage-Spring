<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#modPhotoS").click(function() {
			$("#modPhotoS").css("display", "none");
			$("#modPhoto").css("display", "inline");
			$("#modPhotoE").css("display", "inline");
		});
		$("#modPhotoE").click(function() {
			$("#modPhotoE").css("display", "none");
			$("#modPhoto").css("display", "none");
			$("#modPhotoS").css("display", "inline");
		});
		$("#modNameS").click(function() {
			$("#modNameS").css("display", "none");
			$("#name").css("display", "none");
			$("#modName").css("display", "inline");
			$("#modNameE").css("display", "inline");
		});
		$("#modNameE").click(function() {
			$("#modNameE").css("display", "none");
			$("#modName").css("display", "none");
			$("#name").css("display", "inline");
			$("#modNameS").css("display", "inline");
		});
		$("#modResumeS").click(function() {
			$("#modResumeS").css("display", "none");
			$("#resume").css("display", "none");
			$("#modResume").css("display", "inline");
			$("#modResumeE").css("display", "inline");
		});
		$("#modResumeE").click(function() {
			$("#modResumeE").css("display", "none");
			$("#modResume").css("display", "none");
			$("#resume").css("display", "inline");
			$("#modResumeS").css("display", "inline");
		});
		$("#modCertificateS").click(function() {
			$("#modCertificateS").css("display", "none");
			$("#certificate").css("display", "none");
			$("#modCertificate").css("display", "inline");
			$("#modCertificateE").css("display", "inline");
		});
		$("#modCertificateE").click(function() {
			$("#modCertificateE").css("display", "none");
			$("#modCertificate").css("display", "none");
			$("#certificate").css("display", "inline");
			$("#modCertificateS").css("display", "inline");
		});
	});
</script>
</head>
<body>
	<table border="solid">
		<tr>
			<td>
				<table border="solid">
					<tr>
						<td><span id="photo" class="main"><img alt="강사 사진"
								src="${t.st_photo }"></span><br> <input id="modPhoto"
							class="modE" value="${t.st_photo }">
							<button id="modPhotoS" class="modS">수정</button>
							<button id="modPhotoE" class="modE">완료</button></td>
					</tr>
					<tr>
						<td><h3>
								<span id="name" class="main"> ${t.st_name } </span> <input
									id="modName" class="modE" value="${t.st_name }">
							</h3> 강사님
							<button id="modNameS" class="modS">수정</button>
							<button id="modNameE" class="modE">완료</button></td>
					</tr>
				</table>
			</td>
			<td>
				<table border="solid">
					<tr>
						<td><h3>
								교육경력사항
								<button id="modResumeS" class="modS">수정</button>
								<button id="modResumeE" class="modE">완료</button>
							</h3></td>
					</tr>
					<tr>
						<td><span id="resume" class="main"> ${t.st_resume } </span> <textarea
								id="modResume" class="modE" rows="" cols="">${t.st_resume }</textarea>
						</td>
					</tr>
					<tr>
						<td><h3>
								보유자격증
								<button id="modCertificateS" class="modS">수정</button>
								<button id="modCertificateE" class="modE">완료</button>
							</h3></td>
					</tr>
					<tr>
						<td><span id="certificate" class="main">
								${t.st_certificate } </span> <textarea id="modCertificate" class="modE"
								rows="" cols="">${t.st_certificate }</textarea></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>