<%--
  Created by IntelliJ IDEA.
  User: hoho715
  Date: 11/4/2025
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lecture</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<a href="<c:url value="/course" />">Return to course list</a><br/>
  ${lectureData.lectureName}<br/>
  ${lectureData.lectureDescription}<br/>

<body class="bg-light">
<div class="container mt-4">
    <div class="card shadow">
        <div class="card-body">
            <a href="<c:url value="/course" />" class="btn btn-secondary mb-3">&laquo; Return to Course List</a>

            <div class="card mb-4">
                <div class="card-body">
                    <h2 class="card-title">${lectureData.lectureName}</h2>
                    <p class="card-text">${lectureData.lectureDescription}</p>
                    <security:authorize access="hasRole('ADMIN')">
                        <a href="<c:url value="/course/delete/${lectureData.id}" />"
                           class="btn btn-danger btn-sm">Delete Lecture</a>
                    </security:authorize>
                </div>
            </div>

            <div class="card">
                <div class="card-header bg-dark text-white">
                    <h5 class="mb-0">Lecture Materials</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <tbody>
                            <c:forEach items="${lectureData.attachments}" var="attachment" varStatus="status">
                                <tr>
                                    <td class="align-middle">
                                        <a href="<c:url value="/course/${lectureData.id}/attachment/${attachment.id}" />"
                                           class="text-decoration-none">
                                                ${attachment.name}
                                        </a>
                                    </td>
                                    <security:authorize access="hasRole('ADMIN')">
                                        <td class="text-end">
                                            <a href="<c:url value="/course/${lectureData.id}/delete/${attachment.id}" />"
                                               class="btn btn-danger btn-sm">Delete</a>
                                        </td>
                                    </security:authorize>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<security:authentication var="userid" property="principal.username" />
<form action="<c:url value="/course/${lectureData.id}/user/${userid}/comment"/>" method="post">
    <input type="text" name="message" required>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="submit" value="comment">
</form>

<table>
    <tr>
        <th>Comments</th>
    </tr>

    <c:forEach items="${messageData}" var="message" varStatus="status">
        <tr>
            <td>
                    ${message.regUser.username}:${message.content}
            </td>
            <security:authorize access="hasRole('ADMIN')">
                <td>
                    [<a href="<c:url value="/course/${lectureData.id}/deleteMessage/${message.id}" />">Delete</a>]
                </td>
            </security:authorize>
        </tr>
    </c:forEach>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
