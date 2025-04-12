<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Support</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .error {
            color: red;
            font-weight: bold;
        }
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
    </style>
</head>
<body class="bg-light">
<div class="container">
    <div class="card shadow">
        <div class="card-body">
            <a href="<c:url value="/login" />" class="btn btn-secondary mb-4">Back</a>
            <h2 class="mb-4">Register</h2>

            <form:form method="POST" modelAttribute="regUser">
                <div class="mb-3">
                    <form:label path="fullname" class="form-label">Full name</form:label>
                    <form:input type="text" path="fullname" class="form-control" value="${user.fullName}"/>
                    <form:errors path="fullname" cssClass="error" />
                </div>

                <div class="mb-3">
                    <form:label path="username" class="form-label">Username</form:label>
                    <form:input type="text" path="username" class="form-control" value="${user.username}"/>
                    <form:errors path="username" cssClass="error" />
                </div>

                <div class="mb-3">
                    <form:label path="password" class="form-label">Password</form:label>
                    <form:input type="password" path="password" class="form-control" value="${fn:substringAfter(user.password, '{noop}')}"/>
                    <form:errors path="password" cssClass="error" />
                </div>

                <div class="mb-3">
                    <form:label path="confirm_password" class="form-label">Confirm Password</form:label>
                    <form:input type="password" path="confirm_password" class="form-control" />
                    <form:errors path="confirm_password" cssClass="error" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Roles</label>
                    <div class="form-check">
                        <form:radiobutton path="roles" name="role" value="ROLE_USER" class="form-check-input" checked="${user.role.toString().equals('ROLE_USER')?'checked':''}"/>
                        <label class="form-check-label">Student</label>
                    </div>
                    <div class="form-check">
                        <form:radiobutton path="roles" name="role" value="ROLE_ADMIN" class="form-check-input" checked="${user.role.toString().equals('ROLE_ADMIN')?'checked':''}"/>
                        <label class="form-check-label">Teacher</label>
                    </div>
                    <form:errors path="roles" cssClass="error" />
                </div>

                <div class="mb-3">
                    <form:label path="phone" class="form-label">Phone</form:label>
                    <form:input type="tel" path="phone" class="form-control" value="${user.phoneNumber}"/>
                    <form:errors path="phone" cssClass="error" />
                </div>

                <div class="mb-4">
                    <form:label path="email" class="form-label">Email</form:label>
                    <form:input type="email" path="email" class="form-control" value="${user.emailAddress}"/>
                    <form:errors path="email" cssClass="error" />
                </div>

                <div class="d-grid gap-2">
                    <input type="submit" value="Apply" class="btn btn-primary"/>
                </div>
            </form:form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
