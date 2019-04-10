<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/4.1.3/css/bootstrap.min.css">

    <title>List of users</title>
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

<div class="row">
    <div class="col-xl-2" style="background-color: #F7F7F7;  padding-right: 0">
        <ul class="nav flex-column" style="padding-top: 20px">
            <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/admin"
                                    style="background-color: #519ED4; color: white">Admin</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user">User</a></li>
        </ul>
    </div>

    <div class="col-xl-10">
        <div class="container" style="padding-top: 20px">
            <h1 align="left">Admin panel</h1><br>

            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a id="admin-tab" role="tab" href="#adminTab" class="nav-link active" data-toggle="tab"
                       aria-controls="admin" aria-selected="true">Admin</a>
                </li>
                <li class="nav-item">
                    <a id="newUser-tab" role="tab" href="#addTab" class="nav-link" data-toggle="tab"
                       aria-controls="newUser" aria-selected="false">New user</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="adminTab" aria-labelledby="admin-tab" role="tabpanel">
                    <div class="card">
                        <div class=" card-header" <%--style="background-color: #F2F2F2"--%>>
                            <strong>All users</strong>
                        </div>
                        <div class="card-body " style=" padding: 0 5px 5px 5px;">

                            <table class="table table-striped" style="background-color: white">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Login</th>
                                    <th>Password</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${users}" var="user">
                                    <tr>
                                        <td><c:out value="${user.id}"/></td>
                                        <td><c:out value="${user.name}"/></td>
                                        <td><c:out value="${user.login}"/></td>
                                        <td><c:out value="${user.password}"/></td>
                                        <td><c:out value="${user.email}"/></td>
                                        <td>
                                            <c:forEach items="${user.roles}" var="role">
                                                <c:out value="${role.name}"/>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                                    data-target="#editModal"
                                                    data-user-id="${user.id}"
                                                    data-user-name="${user.name}"
                                                    data-user-login="${user.login}"
                                                    data-user-password="${user.password}"
                                                    data-user-email="${user.email}">Edit
                                            </button>

                                            <div class="modal fade" id="editModal" tabindex="-1" role="dialog"
                                                 aria-labelledby="editModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <form:form method="post"
                                                                   action="${pageContext.request.contextPath}/admin/update">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="editModalLabel">Edit
                                                                    user</h5>
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                        aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="container" align="center">

                                                                    <div class="form-group col-6">
                                                                        <label><strong>ID</strong></label>
                                                                        <label>
                                                                            <input class="form-control"
                                                                                   type="text"
                                                                                   name="id" readonly="">
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-group col-6">
                                                                        <label><strong>Name</strong></label>
                                                                        <label>
                                                                            <input class="form-control" type="text"
                                                                                   name="name">
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-group col-6">
                                                                        <label><strong>Login</strong></label>
                                                                        <label>
                                                                            <input class="form-control" type="text"
                                                                                   name="login">
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-group col-6">
                                                                        <label><strong>Password</strong></label>
                                                                        <label>
                                                                            <input class="form-control" type="text"
                                                                                   name="password">
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-group col-6">
                                                                        <label><strong>Email</strong></label>
                                                                        <label>
                                                                            <input class="form-control" type="text"
                                                                                   name="email">
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-group col-6">
                                                                        <label><strong>Role</strong></label><br>
                                                                        <label>
                                                                            <input type="checkbox" name="isAdmin">Admin
                                                                            <input type="checkbox" name="isUser">User
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary"
                                                                        data-dismiss="modal">Close
                                                                </button>
                                                                <button type="submit" class="btn btn-primary">Edit user
                                                                </button>
                                                            </div>
                                                        </form:form>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="/admin/delete/<c:out value="${user.id}"/>"
                                               class="btn btn-primary"
                                               role="button">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="addTab" aria-labelledby="newUser-tab" role="tabpanel">
                    <div class="card">
                        <div class="card-header">
                            <strong>Add new user</strong>
                        </div>
                        <div class="card-body">
                            <div class="container" align="center">
                                <form:form method="post" action="${pageContext.request.contextPath}/admin/add">
                                    <div class="form-group col-4">
                                        <label><strong>Name</strong></label>
                                        <input class="form-control" type="text" placeholder="Name" name="name">
                                    </div>
                                    <div class="form-group col-4">
                                        <label><strong>Login</strong></label>
                                        <input class="form-control" type="text" placeholder="Login" name="login">
                                    </div>
                                    <div class="form-group col-4">
                                        <label><strong>Password</strong></label>
                                        <input class="form-control" type="text" placeholder="Password" name="password">
                                    </div>
                                    <div class="form-group col-4">
                                        <label><strong>Email</strong></label>
                                        <input class="form-control" type="text" placeholder="Email" name="email">
                                    </div>
                                    <div class="form-group col-4">
                                        <label><strong>Role</strong></label><br>
                                        <label>
                                            <input type="checkbox" name="isAdmin">Admin
                                            <input type="checkbox" name="isUser">User
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-success" type="submit">Add new user</button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/webjars/jquery/3.3.1-2/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script>
    $('#editModal').on('show.bs.modal', function (e) {
        var userId = $(e.relatedTarget).data('user-id');
        var userName = $(e.relatedTarget).data('user-name');
        var userLogin = $(e.relatedTarget).data('user-login');
        var userPass = $(e.relatedTarget).data('user-password');
        var userEmail = $(e.relatedTarget).data('user-email');
        $(e.currentTarget).find('input[name="id"]').val(userId);
        $(e.currentTarget).find('input[name="name"]').val(userName);
        $(e.currentTarget).find('input[name="login"]').val(userLogin);
        $(e.currentTarget).find('input[name="password"]').val(userPass);
        $(e.currentTarget).find('input[name="email"]').val(userEmail);
    })
</script>
<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }
</script>

</body>
</html>
