<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${courseName}</title>
</head>
<body>
    Cs online course

    <security:authorize access="!(hasRole('ADMIN') or hasRole('USER'))">
        <c:url var="logoutUrl" value="/logout"/>
        <a href="/csCourse/login">Log in</a>
        <br/>
    </security:authorize>

    <security:authorize access="hasRole('ADMIN') or hasRole('USER')">
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <br/>
    </security:authorize>

    <security:authorize access="hasRole('ADMIN')">
    <a href="<c:url value="/user" />">Manage User Accounts</a><br /><br />
    </security:authorize>

    <security:authorize access="hasRole('ADMIN')">
        <a href="<c:url value="/course/create" />">Add Lecture</a><br /><br />
    </security:authorize>

    <security:authorize access="hasRole('USER')">
        <security:authentication var="userid" property="principal.username" />
        <a href="<c:url value="/user/update/${userid}" />">Manage account</a><br /><br />
    </security:authorize>
    <br/>

    <c:choose>
        <c:when test="${fn:length(lectureData) == 0}">
            <i>There are no lecture available.</i>
            <br/>
        </c:when>
        <c:otherwise>
            <table border="1">
                <tr>
                    <th>Lecture</th>
                </tr>
                <c:forEach items="${lectureData}" var="entry">
                    <tr>
                        <td><a href="/csCourse/course/lecture/${entry.id}">${entry.lectureName}</a><br/></td>
                        <td><a href="<c:url value="/course/edit/${entry.id}" />">Edit</a><br /><br /> </td>
                        <security:authorize access="hasRole('ADMIN')">
                            <td>
                                [<a href="<c:url value="/course/delete/${entry.id}" />">Delete</a>]
                            </td>
                        </security:authorize>
                    </tr>

                </c:forEach>
            </table>

        </c:otherwise>
    </c:choose>
</body>
</html>
