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

<table>
    <tr>
        <th>Lecture material</th>
    </tr>
    <security:authorize access="hasRole('ADMIN')">
        <td>
            [<a href="<c:url value="/course/delete/${lectureData.id}" />">Delete lecture</a>]
        </td>
    </security:authorize>

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
</body>
</html>
