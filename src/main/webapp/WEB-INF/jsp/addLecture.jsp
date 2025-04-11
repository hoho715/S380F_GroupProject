<!DOCTYPE html>
<html>
<head>
  <title>Customer Support</title>
</head>
<body>
<h2>Create a Ticket</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureForm">
  <form:label path="letureName">Lecture Name</form:label><br/>
  <form:input type="text" path="letureName"/>
  <br/><br/>
  <form:label path="lectureDescription">Descrption</form:label><br/>
  <form:input type="text" path="lectureDescription"/>
  <br/><br/>
  <b>Attachments</b><br/>
  <input type="file" name="attachments" multiple="multiple"/><br/><br/>
  <input type="submit" value="Submit"/>
</form:form>
</body>
</html>