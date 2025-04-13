<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
<div class="container mt-4">
    <div class="card shadow">
        <div class="card-body">
            <a href="<c:url value="/course" />" class="btn btn-secondary mb-3">&laquo; Back to Course List</a>
            <h2 class="mb-4">User Management</h2>

            <a href="<c:url value="/user/create" />" class="btn btn-primary mb-4">Create New User</a>

            <c:choose>
                <c:when test="${fn:length(regUsers) == 0}">
                    <div class="alert alert-warning">There are no users in the system.</div>
                </c:when>
                <c:otherwise>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead class="table-dark">
                            <tr>
                                <th>Full Name</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Role</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${regUsers}" var="user">
                                <tr>
                                    <td>${user.fullName}</td>
                                    <td>${user.username}</td>
                                    <td>${fn:substringAfter(user.password, '{noop}')}</td>
                                    <td>${user.role.toString()}</td>
                                    <td>${user.emailAddress}</td>
                                    <td>${user.phoneNumber}</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="<c:url value="/user/update/${user.id}" />"
                                               class="btn btn-sm btn-primary">Edit</a>
                                            <a href="<c:url value="/user/delete/${user.id}" />"
                                               class="btn btn-sm btn-danger">Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>