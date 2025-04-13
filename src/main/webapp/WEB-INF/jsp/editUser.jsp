<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit User</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .error {
      color: #dc3545;
      font-size: 0.875em;
    }
  </style>
</head>
<body>

<body class="bg-light">
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
      <div class="card shadow">
        <div class="card-body">
          <div class="mb-4">
            <security:authorize access="hasRole('ADMIN')">
              <a href="<c:url value="/user" />" class="btn btn-secondary">&laquo; Back</a>
            </security:authorize>
            <security:authorize access="hasRole('USER')">
              <a href="<c:url value="/" />" class="btn btn-secondary">&laquo; Back</a>
            </security:authorize>
          </div>


          <form:form method="POST" modelAttribute="editUser" class="needs-validation" novalidate="novalidate">
            <div class="mb-3">
              <form:label path="fullname" class="form-label">Full name</form:label>
              <form:input type="text" path="fullname" class="form-control"
                          value="${user.fullName}" required="required"/>
              <form:errors path="fullname" cssClass="error" />
            </div>

            <div class="mb-3">
              <form:label path="username" class="form-label">Username</form:label>
              <form:input type="text" path="username" class="form-control"
                          value="${user.username}" required="required"/>
              <form:errors path="username" cssClass="error" />
            </div>

            <div class="mb-3">
              <form:label path="password" class="form-label">Password</form:label>
              <form:input type="password" path="password" class="form-control"
                          value="${fn:substringAfter(user.password, '{noop}')}" required="required"/>
              <form:errors path="password" cssClass="error" />
            </div>

            <div class="mb-3">
              <form:label path="confirm_password" class="form-label">Confirm Password</form:label>
              <form:input type="password" path="confirm_password" class="form-control" required="required"/>
              <form:errors path="confirm_password" cssClass="error" />
            </div>

            <div class="mb-3">
              <label class="form-label">Roles</label>
              <div class="form-check">
                <form:radiobutton path="roles" value="ROLE_USER"
                                  class="form-check-input"
                                  id="roleUser"
                                  checked="${user.role.toString().equals('ROLE_USER')?'checked':''}"/>
                <label class="form-check-label" for="roleUser">Student</label>
              </div>
              <div class="form-check">
                <form:radiobutton path="roles" value="ROLE_ADMIN"
                                  class="form-check-input"
                                  id="roleAdmin"
                                  checked="${user.role.toString().equals('ROLE_ADMIN')?'checked':''}"/>
                <label class="form-check-label" for="roleAdmin">Teacher</label>
              </div>
              <form:errors path="roles" cssClass="error" />
            </div>

            <div class="mb-3">
              <form:label path="phone" class="form-label">Phone</form:label>
              <form:input type="tel" path="phone" class="form-control"
                          value="${user.phoneNumber}" required="required"/>
              <form:errors path="phone" cssClass="error" />
            </div>

            <div class="mb-3">
              <form:label path="email" class="form-label">Email</form:label>
              <form:input type="email" path="email" class="form-control"
                          value="${user.emailAddress}" required="required"/>
              <form:errors path="email" cssClass="error" />
            </div>

            <div class="d-grid gap-2 mt-4">
              <input type="submit" value="Apply" class="btn btn-primary"/>
            </div>
          </form:form>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
