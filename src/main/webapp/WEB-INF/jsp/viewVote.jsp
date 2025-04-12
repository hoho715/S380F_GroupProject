<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <a href="<c:url value="/course" />">Return to course list</a><br/>
    <a href="<c:url value="/poll/delete/${poll.id}" />">Delete poll</a><br/>

    ${poll.question}<br/>
    ${poll.pollOptions[0].text}/(vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==1).count()})<br/>
    ${poll.pollOptions[1].text}/(vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==2).count()})<br/>
    ${poll.pollOptions[2].text}/(vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==3).count()})<br/>
    ${poll.pollOptions[3].text}/(vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==4).count()})<br/>

    <security:authentication var="userid" property="principal.username" />
    <form action="<c:url value="/poll/${poll.id}/user/${userid}/comment"/>" method="post">
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
                        [<a href="<c:url value="/poll/${poll.id}/deleteMessage/${message.id}" />">Delete</a>]
                    </td>
                </security:authorize>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
