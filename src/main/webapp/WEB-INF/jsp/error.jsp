<!DOCTYPE html>
<html>
<head>
    <title>Error Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card shadow">
                <div class="card-body text-center">
                    <h2 class="text-danger mb-4">⚠️ Error Occurred</h2>

                    <div class="alert alert-danger">
                        <c:choose>
                            <c:when test="${empty message}">
                                <p class="mb-3">Something went wrong. Please try again later.</p>
                                <ul class="list-unstyled">
                                    <li><strong>Status Code:</strong> ${status}</li>
                                    <li><strong>Exception:</strong> ${exception}</li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <p class="mb-0">${message}</p>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <a href="<c:url value="/course" />" class="btn btn-primary mt-3">
                        ← Return to Course List
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>