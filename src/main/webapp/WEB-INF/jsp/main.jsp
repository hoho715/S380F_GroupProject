<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${courseName}</title>
</head>
<body>
    Cs online course

    <c:choose>
        <c:when test="${principal == null}">
            <c:url var="loginUrl" value="/login"/>
            <form action="${loginUrl}" method="post">
                <input type="submit" value="Log in" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </c:when>
        <c:otherwise>
            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input type="submit" value="Log out" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            <br/>
        </c:otherwise>
    </c:choose>




    <security:authorize access="hasRole('ADMIN')">
    <a href="<c:url value="/user" />">Manage User Accounts</a><br /><br />
    </security:authorize>
    <br/>

    <c:choose>
        <c:when test="${fn:length(lectureData) == 0}">
            <i>There are no lecture available.</i>
            <br/>
        </c:when>
        <c:otherwise>
            <c:forEach items="${lectureData}" var="entry">
                Lecture ${entry.id}:${entry.lectureName}<br />
            </c:forEach>
        </c:otherwise>
    </c:choose>
</body>
</html>
