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
</head>
<body>
<a href="<c:url value="/course" />">Return to course list</a><br/>
  ${lectureData.lectureName}<br/>
  ${lectureData.lectureDescription}<br/>

<security:authorize access="hasRole('ADMIN')">
    <td>
        [<a href="<c:url value="/course/delete/${lectureData.id}" />">Delete lecture</a>]
    </td>
</security:authorize>

<table>
    <tr>
        <th>Lecture material</th>
    </tr>

        <c:forEach items="${lectureData.attachments}" var="attachment" varStatus="status">
    <tr>
            <td>
                <a href="<c:url value="/course/${lectureData.id}/attachment/${attachment.id}" />"><c:out value="${attachment.name}"/></a>
            </td>

            <security:authorize access="hasRole('ADMIN')">
            <td>
                [<a href="<c:url value="/course/${lectureData.id}/delete/${attachment.id}" />">Delete</a>]
            </td>
            </security:authorize>
    </tr>
        </c:forEach>
</table>

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
</body>
</html>
