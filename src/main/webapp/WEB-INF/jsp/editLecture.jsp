<!DOCTYPE html>
<html>
<head>
    <title>Edit Lecture</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
<div class="container mt-4">
    <div class="d-flex justify-content-end mb-4">
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post" class="mb-0">
            <input type="submit" value="Log out" class="btn btn-danger"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>

    <div class="card shadow">
        <div class="card-body">
            <h2 class="card-title mb-4">Edit Lecture #${lecture.id}</h2>

            <form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureForm" class="needs-validation">
                <div class="mb-3">
                    <form:label path="letureName" class="form-label">Lecture Name</form:label>
                    <form:input type="text" path="letureName" class="form-control"/>
                </div>

                <div class="mb-3">
                    <form:label path="lectureDescription" class="form-label">Description</form:label>
                    <form:textarea path="lectureDescription" class="form-control" rows="5"/>
                </div>

                <div class="mb-4">
                    <label class="form-label fw-bold">Add Attachments</label>
                    <input type="file" name="attachments" class="form-control-file" multiple="multiple"/>
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                    <input type="submit" value="Save" class="btn btn-primary me-md-2"/>
                    <a href="<c:url value="/course" />" class="btn btn-secondary">Return to Lectures</a>
                </div>
            </form:form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>