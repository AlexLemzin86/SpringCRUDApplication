<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/4.1.3/css/bootstrap.css">
    <title>Title</title>
</head>
<body onload='document.loginForm.username.focus();' style="background-color: #F1F1F1">
<div class="container" align="center">
    <div class="row" style="height: 60px">
        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-12">
            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>
            <c:if test="${not empty msg}">
                <div class="msg">${msg}</div>
            </c:if>
        </div>
    </div>
    <form name='loginForm' action="<c:url value='/login' />" method='POST'>
        <div class="form-group col-3">
            <h3 align="left">Please sign in</h3>
            <input class="form-control" type='text' name='username' placeholder="Login">
            <input class="form-control" type='password' name='password' placeholder="Password"/>
        </div>
        <div class="form-group col-3">
            <button type="submit" class="btn btn-primary btn-block">Sign in</button>
        </div>
        <%--<label>
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
        </label>--%>
    </form>
</div>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/webjars/jquery/3.3.1-2/jquery.js"></script>
</body>
</html>
