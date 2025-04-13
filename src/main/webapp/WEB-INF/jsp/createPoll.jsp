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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card shadow">
                <div class="card-body">
                    <h2>Create Poll</h2>
                    <form:form method="POST" enctype="multipart/form-data" modelAttribute="PollForm">
                        <form:label path="question">Question</form:label><br/>
                        <form:input type="text" path="question" class="col-10"/>
                        <form:errors path="question" cssClass="error" />
                        <br/><br/>
                        <form:label path="option1">Option 1</form:label><br/>
                        <form:input type="text" path="option1"/>
                        <form:errors path="option1" cssClass="error" />
                        <br/><br/>
                        <form:label path="option2">Option 2</form:label><br/>
                        <form:input type="text" path="option2"/>
                        <form:errors path="option2" cssClass="error" />
                        <br/><br/>
                        <form:label path="option3">Option 3</form:label><br/>
                        <form:input type="text" path="option3"/>
                        <form:errors path="option3" cssClass="error" />
                        <br/><br/>
                        <form:label path="option4">Option 4</form:label><br/>
                        <form:input type="text" path="option4"/>
                        <form:errors path="option4" cssClass="error" />
                        <br/><br/>
                        <input type="submit" value="Submit"/>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>



</body>
</html>