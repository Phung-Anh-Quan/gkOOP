<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<nav class="navbar navbar-expand-lg text-bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Project</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <c:if test="${sessionScope.user != null}">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/home">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/logout">Đăng xuất</a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.user == null}">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/login">Đăng nhập</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/register">Đăng ký</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>