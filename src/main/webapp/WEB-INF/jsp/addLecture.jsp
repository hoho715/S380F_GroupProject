<!DOCTYPE html>
<html>
<head>
  <title>Add Lecture</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .error {
      color: #dc3545;
      font-size: 0.875em;
    }
  </style>
</head>

<body class="bg-light">
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
      <div class="card shadow">
        <div class="card-body">
          <h2 class="card-title text-center mb-4">Create Lecture</h2>

          <form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureForm" class="needs-validation">
            <div class="mb-3">
              <form:label path="letureName" class="form-label">Lecture Name</form:label>
              <form:input type="text" path="letureName" class="form-control"/>
              <form:errors path="letureName" cssClass="error" />
            </div>

            <div class="mb-3">
              <form:label path="lectureDescription" class="form-label">Description</form:label>
              <form:input type="text" path="lectureDescription" class="form-control"/>
              <form:errors path="lectureDescription" cssClass="error" />
            </div>

            <div class="mb-4">
              <label class="form-label fw-bold">Attachments</label>
              <input type="file" name="attachments" class="form-control" multiple="multiple"/>
            </div>

            <div class="d-grid">
              <input type="submit" value="Submit" class="btn btn-primary"/>
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