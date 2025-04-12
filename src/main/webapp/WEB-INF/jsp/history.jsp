<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<a href="<c:url value="/course" />">Return to course list</a><br/>
<h1>Lecture</h1>
<table border="1">
    <tr>
        <th>Lecture</th>
        <th>Action</th>
        <th>Comment</th>
    </tr>
    <c:forEach items="${lCommentHistory}" var="entry">
        <tr>
            <td>${entry.lectureName}</td>
            <td>${entry.action}</td>
            <td>${entry.comment}</td>
        </tr>
    </c:forEach>
</table>

<table border="1">
    <tr>
        <th>poll</th>
        <th>Action</th>
        <th>Comment</th>
    </tr>
    <c:forEach items="${pCommentHistory}" var="entry">
        <tr>
            <td>${entry.pollQuestion}</td>
            <td>${entry.action}</td>
            <td>${entry.comment}</td>
        </tr>
    </c:forEach>
</table>

<table border="1">
    <tr>
        <th>Lecture</th>
        <th>Action</th>
        <th>Comment</th>
    </tr>
    <c:forEach items="${voteHistory}" var="entry">
        <tr>
            <td>${entry.pollQuestion}</td>
            <td>${entry.action}</td>
            <td>${entry.option}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>