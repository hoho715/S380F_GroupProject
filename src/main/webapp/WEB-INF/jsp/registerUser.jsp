<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Support</title>
    <style>
        .error {
            color: red;
            font-weight: bold;
            display: block;
        }
    </style>
</head>
<body>

<a href="<c:url value="/login" />">Back</a>

<h2>Register</h2>
<form:form method="POST" modelAttribute="regUser">
    <form:label path="fullname">Full name</form:label><br/>
    <form:errors path="fullname" cssClass="error" />
    <form:input type="text" path="fullname" value="${user.fullName}"/>
    <br/><br/>
    <form:label path="username">Username</form:label><br/>
    <form:errors path="username" cssClass="error" />
    <form:input type="text" path="username" value="${user.username}"/>
    <br/><br/>
    <form:label path="password">Password</form:label><br/>
    <form:errors path="password" cssClass="error" />
    <form:input type="text" path="password" value="${fn:substringAfter(user.password, '{noop}')}"/>
    <br/><br/>
    <form:label path="confirm_password">Confirm Password</form:label><br/>
    <form:errors path="confirm_password" cssClass="error" />
    <form:input type="text" path="confirm_password" />
    <br/><br/>
    <form:label path="roles">Roles</form:label><br/>
    <form:errors path="roles" cssClass="error" />
    <form:radiobutton path="roles" name="role" value="ROLE_USER" checked="${user.role.toString().equals('ROLE_USER')?'checked':''}"/>Student
    <form:radiobutton path="roles" name="role" value="ROLE_ADMIN" checked="${user.role.toString().equals('ROLE_ADMIN')?'checked':''}"/>Teacher

    <br/><br/>
    <form:label path="phone">phone</form:label><br/>
    <form:errors path="phone" cssClass="error" />
    <form:input type="text" path="phone" value="${user.phoneNumber}"/>
    <br/><br/>
    <form:label path="email">email</form:label><br/>
    <form:errors path="email" cssClass="error" />
    <form:input type="text" path="email" value="${user.emailAddress}"/>
    <br/><br/>
    <input type="submit" value="Apply"/>
</form:form>
</body>
</html>
