<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
}

div {
	border: 1px solid transparent;
	display: block;
}

.content h1 {
	padding-top: 50px;
	text-align: center;
}

.tableArea {
	margin-top: 100px;
	border: 3px solid lightgray;
	margin: auto;
	min-height: 350px;
	width: 600px;
	min-width: 560px;
	padding: 5px;
}

.btnArea {
	text-align : center;
}

.btn {
	color : white;
	background : rgb(52, 73, 94);
}

h1, h3 {
	color : rgb(52, 73, 94) !important;
}

#boardTable {
	border-bottom: 1px solid lightgray;
	text-align: center;
	width: 100%;
	min-width: 550px;
	min-height: 300px;
	line-height: 2.5;
	border-collapse: collapse;
}

#boardTable tr:not(:last-child) {
	border-bottom: 1px solid lightgray;
}

#boardTable tr:last-child {
	height: 200px;
}

.contentArea {
	min-height: 200px;
	text-align: left;
	overflow: auto;
}

#boardTable td:nth-child(1) {
	width: 50px;
}

#boardTable td:nth-child(2) {
	width: 50px;
}

#boardTable td:nth-child(3) {
	width: 100px;
}

#boardTable td:nth-child(4) {
	width: 200px;
}

#boardTable td:nth-child(5) {
	width: 100px;
}

#boardTable td:nth-child(5) {
	width: 150px;
}

/* λκΈ μμ­ */
.outer {
	width: 600px;
	margin: auto;
	text-align: center;
}

.replySelectArea {
	width: 600px;
	min-height : 100px;
	margin: auto;
	margin-bottom : 50px;
	border: 3px solid lightgray;
}

#replyTable {
	text-align: center;
	width: 100%;
	line-height: 2.5;
	border-collapse: collapse;
	border-bottom: 1px solid lightgray;
}

#replyTable td:nth-child(1), #replyTable td:nth-child(3) {
	width: 100px;
}

#replyTable tr:not(:last-child) {
	border-bottom: 1px solid lightgray;
}

.replyWriterArea {
	text-align: center;
	padding-top: 50px;
	border-bottom: 1px solid lightgray;
	
}

.replyWriterArea textarea {
	width: 600px;
	height: 100px;
	padding: 10px 10px 14px 10px;
	border: solid 1px #dadada;
	resize: none;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../common/sidebar.jsp" />
	<div class="content">
		<h1>Q&A</h1>
		<div class="tableArea">
			<table id="boardTable">
				<tr>
					<td style="background : rgb(52, 73, 94); color : white;">λ²νΈ</td>
					<td>${ qna.qid }</td>
					<td style="background : rgb(52, 73, 94); color : white;">μμ±μ</td>
					<td>${ qna.aid }</td>
				</tr>
				<tr>
					<td style="background : rgb(52, 73, 94); color : white;">μ λͺ©</td>
					<td colspan="5">${ qna.qtitle }</td>
				</tr>
				<tr>
					<td colspan="5" style="background : rgb(52, 73, 94); color : white;">λ΄μ©</td>
				</tr>
				<tr>
					<td colspan="5">
					<div class="contentArea"style="font-size : 15px;">${ qna.qcontent }</div>
					</td>
				</tr>
			</table>
			
		<div class="btnArea">
			<button class="btn"
				onclick="location.href='${ contextPath }/qna/list?page=${ param.page }'">λͺ©λ‘μΌλ‘</button>
			<c:if test="${ loginUser.aid eq qna.aid && qna.astatus == 'Y'}">
				<button class="btn"
					onclick="alert('λ΅λ³μ΄ μλ κΈμ μ­μ ν  μ μμ΅λλ€.')">μμ νκΈ°</button>
				<button class="btn" onclick="checkDelete()">μ­μ νκΈ°</button>
			</c:if>
			<c:if test="${ loginUser.aid eq qna.aid && qna.astatus == 'N'}">
				<button class="btn"
					onclick="location.href='${ contextPath }/qna/updatePage?qid=${ qna.qid }&page=${ param.page }'">μμ νκΈ°</button>
				<button class="btn" onclick="checkDelete()">μ­μ νκΈ°</button>
			</c:if>
		</div>
			
		</div>

	</div>
	<script>
		function checkDelete() {
			if (confirm("μ λ§ μ­μ νμκ² μ΅λκΉ?")) {
				location.href = '${ contextPath }/qna/delete?qid=${ qna.qid }'
			}
		}
	</script>

	<div class="content">
		<div class="outer">
			<br>
			<hr>
			<br>
			<h3>λ΅λ³</h3>
			<div class="replySelectArea">
				<table id="replyTable">
						<c:if test="${ qna.astatus =='Y' }">
						<tr>
							<td style="background : rgb(52, 73, 94); color : white;">μ λͺ©</td>
							<td>${ qna.atitle }</td>
						</tr>
							<tr>
								<td colspan="2" style="background : rgb(52, 73, 94); color : white;">λ΄μ©</td>
								
							</tr>
							<tr>
								<td colspan="2">${ qna.acontent }</td>
							</tr>
						</c:if>
						<c:if test="${ qna.astatus == 'N' }">
							<tr>
								<td style="background : rgb(52, 73, 94); color : white;">μ λͺ©</td>
								<td></td>
							</tr>
							<tr>
								<td colspan="2" style="background : rgb(52, 73, 94); color : white;">λ΄μ©</td>
								
							</tr>
							<tr>
								<td colspan="2">μμ± λ λ΅λ³μ΄ μμ΅λλ€.</td>
							</tr>
						</c:if>
				</table>
			</div>
		</div>
	</div>

	<script>
		$("#addReply").on("click", function() {
			var rcontent = $("#replyContent").val();
			var refQid = $
			{
				qna.qid
			}
			;

			$.ajax({
				url : "${ contextPath }/qna/insertReply",
				data : {
					rcontent : rcontent,
					refQid : refQid
				},
				type : "post",
				dataType : "json",
				success : function(data) {
					console.log(data);

					tableBody = $("#replyTable tbody");
					tableBody.html("");

					for ( var i in data) {
						tr = $("<tr>");
						rwriter = $("<td width='100'>").text(data[i].aid);
						rcontent = $("<td>").text(data[i].acontent);

						tr.append(rwriter, rcontent);
						tableBody.append(tr);
					}

					$("#replyContent").val("");
				}
			});
		});
	</script>
</body>
</html>