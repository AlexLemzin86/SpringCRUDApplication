<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/4.1.3/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.3.1-2/jquery.min.js"></script>
</head>
<body style="background-color: #F1F1F1">
<div class="row">
    <div class="col-xl-12">
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="/login" style="color: #ADADAD">Project name</a>
            <%-- <h3 align="left" style="color: #ADADAD">Project name</h3>--%>
            <c:url value="/logout" var="logoutUrl"/>
            <form action="${logoutUrl}" method="post" id="logoutForm">
                <%--<input type="hidden" name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>--%>
            </form>
            <p align="right"><a href="javascript:formSubmit()" style="color: #ADADAD"> Logout</a></p>
        </nav>
    </div>
</div>
<div class="container">
<h1>HTTP Status 403 - Access is denied</h1>

<c:choose>
    <c:when test="${empty username}">
        <h2>You do not have permission to access this page!</h2>
    </c:when>
    <c:otherwise>
        <h2>Username : ${username} <br/>You do not have permission to access this page!</h2>
    </c:otherwise>
</c:choose>
</div>
<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }
</script>
</body>
</html>
