<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/css.css">
    <title>Project</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>
    <div class="form-box">
        <div class="form-value">
            <%--@elvariable id="userForm" type=""--%>
            <form action="/login" modelAttribute="userForm" method="post">
                <h2>Đăng nhập</h2>
<%--                Error--%>
                <div class="error" style="color: red;">
                    <p>${error}</p>
                </div>
                <div class="inputbox">
                    <ion-icon name="mail-outline"></ion-icon>
                    <input type="text" name="username" id="username" required="required" />
                    <label for="username">Tên đăng nhập</label>
                </div>
                <div class="inputbox">
                    <ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password"  name="password" id="password" required="required" />
                    <label for="password">Mật khẩu</label>
                </div>
                <div class="forget">
                    <label for="forget"><input id="forget" type="checkbox">Ghi nhớ mật khẩu</label>
                </div>
                <button type="submit">Đăng nhập</button>
                <div class="register">
                    <p>Bạn có tài khoản <a href="/register">Đăng ký</a></p>
                </div>
            </form>
        </div>
    </div>
</section>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>