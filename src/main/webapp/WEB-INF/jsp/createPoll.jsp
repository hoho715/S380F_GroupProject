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
<h2>Create a Ticket</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="PollForm">
    <form:label path="question">Question</form:label><br/>
    <form:errors path="question" cssClass="error" />
    <form:input type="text" path="question"/>
    <br/><br/>
    <form:label path="option1">Option 1</form:label><br/>
    <form:errors path="option1" cssClass="error" />
    <form:input type="text" path="option1"/>
    <br/><br/>
    <form:label path="option2">Option 2</form:label><br/>
    <form:errors path="option2" cssClass="error" />
    <form:input type="text" path="option2"/>
    <br/><br/>
    <form:label path="option3">Option 3</form:label><br/>
    <form:errors path="option3" cssClass="error" />
    <form:input type="text" path="option3"/>
    <br/><br/>
    <form:label path="option4">Option 4</form:label><br/>
    <form:errors path="option4" cssClass="error" />
    <form:input type="text" path="option4"/>
    <br/><br/>
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>