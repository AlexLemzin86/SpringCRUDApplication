<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
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
               <%-- <input type="hidden" name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>--%>
            </form>
            <p align="right"><a href="javascript:formSubmit()" style="color: #ADADAD"> Logout</a></p>
        </nav>
    </div>
</div>

<div class="row">
    <c:if test="${pageContext.request.isUserInRole(role)}" >
        <div class="col-xl-2" style="background-color: #F7F7F7; padding-right: 0">
            <ul class="nav flex-column" style="padding-top: 20px">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/admin">Admin</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user"
                                        style="background-color: #519ED4; color: white">User</a></li>
            </ul>
        </div>
    </c:if>

    <div class="col-xl-10">
        <div class="container" style="padding-top: 20px">
           <%-- <c:url value="/logout" var="logoutUrl"/>--%>
            <%--<form action="${logoutUrl}" method="post" id="logoutForm">
                <input type="hidden" name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
            </form>--%>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <h2>
                    Welcome : ${pageContext.request.userPrincipal.name}
                </h2>
            </c:if>
        </div>
    </div>
</div>
<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }
</script>
</body>
</html>