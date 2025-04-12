<!DOCTYPE html>
<html>
<head>
    <title>Customer Support</title>
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<h2>Edit Lecture #${lecture.id}</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureForm">
    <form:label path="letureName">leture Name</form:label><br/>
    <form:input type="text" path="letureName" /><br/><br/>
    <form:label path="lectureDescription">Body</form:label><br/>
    <form:textarea path="lectureDescription" rows="5" cols="30" /><br/><br/>
    <b>Add more attachments</b><br />
    <input type="file" name="attachments" multiple="multiple"/><br/><br/>
    <input type="submit" value="Save"/><br/><br/>
</form:form>
<a href="<c:url value="/course" />">Return to list tickets</a>
</body>
</html>