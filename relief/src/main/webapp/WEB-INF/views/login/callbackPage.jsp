<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"
scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.postcodify_details{
            width: 250px;
            height: 40px;
            border-radius: 5px;
            margin-top: 15px;
            border: 1px solid gray;
        }
     .searchAddressBtn{
            background-color: rgb(0, 51, 85);
            border-radius: 5px;
            color: white;
            height: 50px;
            width:  90px;
            font-weight : bolder;
        }
        .postcodify_postcode5{
            width: 125px;
            height: 40px;
            border-radius: 5px;
            margin-top: 15px;
            margin-right: 220px;
            border: 1px solid gray;
        }
        .postcodify_address{
            width: 250px;
            height: 40px;
            border-radius: 5px;
            margin-top: 15px;
            margin-right: 95px;
            border: 1px solid gray;
        }
        .pwd{
            width: 250px;
            height: 40px;
            border-radius: 5px;
            margin-top: 15px;
            margin-right: 95px;
            border: 1px solid gray;
        }
        .checkPwd{
            width: 250px;
            height: 40px;
            border-radius: 5px;
            margin-right: 95px;
            border: 1px solid gray;
        }
        .insertFormDiv{
            border: 1px solid gray;
            width: 450px;
            height: 750px;
            text-align: center;
            position: absolute;
            top: 10%;
            left: 40%;
        }
        h1{
            color: rgb(0, 51, 85);
        }
        .updateBtn{
            background-color: rgb(0, 51, 85);
            border-radius: 5px;
            color: white;
            margin-right : 25px;
            height: 50px;
            width:  120px;
            font-weight : bolder;
        }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>

	<c:choose>
	
	<c:when test="${ empty loginUser.pwd }">
		<div class="insertFormDiv">
       	<h1>?????? ?????? ??????</h1>
       	<p>????????? ???????????? ?????? ????????? ???????????? ????????? ??????????????????. ?????? ???????????? ????????? ????????? ???????????? ?????? ??????????????? ??????????????????.</p>
       	<form action="${ contextPath }/account/updateNaver" method="POST" id="joinForm" onsubmit="return joinValidate();">
       		<input type="password" id="pwd" class="pwd" name="pwd" placeholder="???????????? ??????" required>
           	<input type="password" id="checkPwd" class="checkPwd" name="checkPwd" placeholder="???????????? ??????">
           	<input type="text" class="postcodify_postcode5" name="post" placeholder="????????????" readonly>
            <input type="text" class="postcodify_address" name="address1" placeholder="?????? ??????" readonly>
            <input type="text" class="postcodify_details" name="address2" placeholder="?????? ?????? ??????">
            <button type="button" class="searchAddressBtn" id="postcodify_search_button">??????</button>
            <button type="submit" class="updateBtn" id="updateBtn">??????</button>
       	</form>
        </div>
        
        <script>
		$(function(){
			alert("${ msg }");
		})
		
		var updateBtn = document.getElementById("updateBtn");
		
		function joinValidate(){
			if($("#joinForm input[name=pwd]").val() != $("#joinForm input[name=checkPwd]").val()){
        		alert('??????????????? ???????????? ????????????.');
        		return false;
        	}
			if($("#joinForm input[name=post]").val() == '' || $("#joinForm input[name=address1]").val() == '' || $("#joinForm input[name=address2]").val() == ''){
        		alert('???????????? ?????? ????????? ????????????.');
        		return false;
        	}
			return true;
		}
		</script>
		<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    	<script>
    		// ?????? ????????? ????????? ?????? ???????????? ???????????? ??????
    		$(function(){
    				$("#postcodify_search_button").postcodifyPopUp();
    		});
    	</script>
    	<c:remove var="msg"/>
	</c:when>
	
	<c:otherwise>
	<script>
		$(function(){
			alert("${ msg }");
			location.href = "${ contextPath }/home";
		})
	</script>
	<c:remove var="msg"/>
	</c:otherwise>
	</c:choose>
	
</body>
</html>