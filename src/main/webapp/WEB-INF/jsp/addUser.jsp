<!DOCTYPE html>
<html>
<head>
  <title>Add User</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .error {
      color: #dc3545;
      font-size: 0.875em;
    }
  </style>
</head>
<body>
<div class="card shadow">
  <div class="card-body">
    <h2 class="card-title mb-4">Add User</h2>

    <form:form method="POST" modelAttribute="addUser" class="needs-validation">
      <div class="mb-3">
        <form:label path="fullname" class="form-label">Full name</form:label>
        <form:input type="text" path="fullname" class="form-control"/>
        <form:errors path="fullname" cssClass="error" />
      </div>

      <div class="mb-3">
        <form:label path="username" class="form-label">Username</form:label>
        <form:input type="text" path="username" class="form-control"/>
        <form:errors path="username" cssClass="error" />
      </div>

      <div class="mb-3">
        <form:label path="password" class="form-label">Password</form:label>
        <form:input type="password" path="password" class="form-control"/>
        <form:errors path="password" cssClass="error" />
      </div>

      <div class="mb-3">
        <form:label path="confirm_password" class="form-label">Confirm Password</form:label>
        <form:input type="password" path="confirm_password" class="form-control"/>
        <form:errors path="confirm_password" cssClass="error" />
      </div>

      <div class="mb-4">
        <label class="form-label">Roles</label>
        <div class="form-check">
          <form:checkbox path="roles" value="ROLE_USER" class="form-check-input" id="roleUser"/>
          <label class="form-check-label" for="roleUser">Student</label>
        </div>
        <div class="form-check">
          <form:checkbox path="roles" value="ROLE_ADMIN" class="form-check-input" id="roleAdmin"/>
          <label class="form-check-label" for="roleAdmin">Teacher</label>
        </div>
        <form:errors path="roles" cssClass="error" />
      </div>

      <div class="d-grid">
        <input type="submit" value="Add User" class="btn btn-primary"/>
      </div>
    </form:form>
  </div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
