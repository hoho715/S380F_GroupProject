<!DOCTYPE html>
<html>
<head>
    <title>CS online course Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .login-container {
            max-width: 400px;
            margin: 0 auto;
            margin-top: 100px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body class="bg-light">
<div class="container">
    <div class="login-container">
        <div class="text-center mb-4">
            <h2 class="text-primary">Online Course Login</h2>
            <p class="text-muted">Please sign in to continue</p>
        </div>

        <c:if test="${param.error != null}">
            <div class="alert alert-danger" role="alert">
                Login failed. Please check your credentials.
            </div>
        </c:if>
        <c:if test="${param.logout != null}">
            <div class="alert alert-success" role="alert">
                You have been logged out successfully.
            </div>
        </c:if>

        <form action="login" method="POST">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="remember-me" name="remember-me">
                <label class="form-check-label" for="remember-me">Remember me</label>
            </div>

            <div class="d-grid mb-3">
                <button type="submit" class="btn btn-primary">Log In</button>
            </div>

            <div class="text-center">
                <p class="text-muted">Don't have an account?
                    <a href="<c:url value="/user/register" />" class="text-decoration-none">Register here</a>
                </p>
            </div>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>