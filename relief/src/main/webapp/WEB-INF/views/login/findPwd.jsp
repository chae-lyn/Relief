<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .headDiv{
            display: inline-block;
        }
        .formDiv{
            border: 1px solid gray;
            width: 450px;
            height: 500px;
            position: absolute;
            top: 15%;
            left: 40%;
            text-align: center;
        }
        .homeimg{
            width: 200px;
            height: 100px;
            display: inline-block;
            margin-left: 400px;
        }
        h1{
            display: inline-block;
            margin-bottom: 0px;
            margin-top: 0px;
            margin-left: 20px;
            color: rgb(0, 51, 85);
            text-align: center;
        }
        .headDiv2{
            display: inline-block;
            position: relative;
            bottom: 30px;
        }
        .c1{
            color: red;
            margin-top: 100px;
            display: inline-block;
        }
        .c2{
            display: inline;
        }
        .name{
            width: 250px;
            height: 40px;
            border-radius: 5px;
            margin-top: 20px;
        }
        .email{
            width: 250px;
            height: 40px;
            border-radius: 5px;
            margin-top: 20px;
        }
        .findPwdBtn{
            width: 260px;
            height: 45px;
            border-radius: 5px;
            margin-top: 20px;
            background-color: rgb(0, 51, 85);
            color: white;
        }
        .id{
            width: 250px;
            height: 40px;
            border-radius: 5px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
	<div class="headDiv">
        <a href="${ contextPath }/home"><img src="${ contextPath }/resources/images/relief.jpg" class="homeimg"></a>
    </div>
    <div class="headDiv2">
        <h1>???????????? ??????</h1>
    </div>
    <hr>
    <div class="formDiv">
        <h3 class="c1">????????????</h3>
        <h3 class="c2">??? ????????? ????????? ?????????????????? ???????????? ??????????????? ?????? ?????????.</h3>
        <form action="${ contextPath }/account/findPwd" method="POST">
            <input type="text" name="aid" class="id" placeholder="?????????">
            <input type="text" name="name" class="name" placeholder="??????">
            <input type="email" name="email" class="email" placeholder="?????????">
            <button type="submit" class="findPwdBtn">??????</button>
        </form>
    </div>
</body>
</html>