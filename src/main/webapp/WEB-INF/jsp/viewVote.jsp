<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <div class="card shadow">
        <div class="card-body">
            <a href="<c:url value="/course" />" class="btn btn-secondary mb-3">Return to course list</a><br/>
            <div class="card mb-4">
                <div class="card-body">
                    <a href="<c:url value="/poll/delete/${poll.id}" />" class="btn btn-danger btn-sm mb-3">Delete poll</a><br/>
                    <div class="card mb-4">
                        <div class="card-body">
                            ${poll.question}<br/>
                        </div>
                    </div>

                    Option 1: ${poll.pollOptions[0].text}<br/>
                    (vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==1).count()})<br/><br/>
                    Option 2: ${poll.pollOptions[1].text}<br/>
                    (vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==2).count()})<br/><br/>
                    Option 3: ${poll.pollOptions[2].text}<br/>
                    (vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==3).count()})<br/><br/>
                    Option 4: ${poll.pollOptions[3].text}<br/>
                    (vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==4).count()})<br/><br/>
                </div>
            </div>
            <security:authentication var="userid" property="principal.username" />
            <form action="<c:url value="/poll/${poll.id}/user/${userid}/comment"/>" method="post">
                <input type="text" name="message" required>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="submit" value="comment">
            </form>

            <div class="table-responsive">
                <table>
                    <thead>
                    <tr>
                        <th>Comments</th>
                    </tr>
                    </thead>
                <tbody>
                <c:forEach items="${messageData}" var="message" varStatus="status">
                    <tr class="py-3 my-1">
                        <td class="col-1">
                            ${message.regUser.username}:
                         </td>
                        <td>
                                ${message.content}
                        </td>
                    <security:authorize access="hasRole('ADMIN')">
                        <td class="col-1">
                            [<a href="<c:url value="/poll/${poll.id}/deleteMessage/${message.id}" />">Delete</a>]
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




</body>
</html>
