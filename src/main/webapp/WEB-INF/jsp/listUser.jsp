<!DOCTYPE html>
<html>
<head><title>Customer Support User Management</title></head>
<body>
<a href="<c:url value="/course" />">Return to course list</a>
<h2>Users</h2>
<a href="<c:url value="/user/create" />">Create a User</a><br /><br />
<c:choose>
    <c:when test="${fn:length(regUsers) == 0}">
        <i>There are no users in the system.</i>
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th>Username</th><th>Password</th><th>Roles</th><th>Email</th><th>Phone number</th><th>Action</th>
            </tr>
            <c:forEach items="${regUsers}" var="user">
                <tr>
                    <td>${user.username}</td>
                    <td>${fn:substringAfter(user.password, '{noop}')}</td>
                    <td>${user.role.toString()}</td>
                    <td>${user.emailAddress}</td>
                    <td>${user.phoneNumber}</td>
                    <td>
                        [<a href="<c:url value="/user/delete/${user.id}" />">Delete</a>]
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>
</body>
</html>