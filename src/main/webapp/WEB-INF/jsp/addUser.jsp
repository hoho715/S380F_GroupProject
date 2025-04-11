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
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Log out"/>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<a href="<c:url value="/user" />">Back</a>

<h2>Add User</h2>
<form:form method="POST" modelAttribute="addUser">
  <form:label path="fullname">Full name</form:label><br/>
  <form:errors path="fullname" cssClass="error" />
  <form:input type="text" path="fullname"/>
  <br/><br/>
  <form:label path="username">Username</form:label><br/>
  <form:errors path="username" cssClass="error" />
  <form:input type="text" path="username"/>
  <br/><br/>
  <form:label path="password">Password</form:label><br/>
  <form:errors path="password" cssClass="error" />
  <form:input type="text" path="password"/>
  <br/><br/>
  <form:label path="confirm_password">Confirm Password</form:label><br/>
<form:errors path="confirm_password" cssClass="error" />
<form:input type="text" path="confirm_password" />
  <br/><br/>
  <form:label path="roles">Roles</form:label><br/>
  <form:errors path="roles" cssClass="error" />
  <form:checkbox path="roles" value="ROLE_USER"/>Student
  <form:checkbox path="roles" value="ROLE_ADMIN"/>Teacher
  <br/><br/>
  <input type="submit" value="Add User"/>
</form:form>
</body>
</html>
