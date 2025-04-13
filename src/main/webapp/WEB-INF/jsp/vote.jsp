<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .error {
            color: red;
            font-weight: bold;
            display: block;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
        <div class="card mb-4 mt-4" style="border: 0">
            <div class="card-body">
                <a href="<c:url value="/course"/>" class="btn btn-secondary mb-2">Return to course list</a><br/>
                <form:form method="POST" modelAttribute="VoteForm">
                    <h3>${poll.question}</h3>
                    <form:errors path="option" cssClass="error" />
                    <form:radiobutton path="option" name="opt" value="1" checked="${response.pollOption.idx == 1 ? 'checked':''}" style="margin-right: 5px"/>
                    ${poll.pollOptions[0].text}<br/>(vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==1).count()})<br/>
                    <form:radiobutton path="option" name="opt" value="2" checked="${response.pollOption.idx == 2 ? 'checked':''}" style="margin-right: 5px"/>
                    ${poll.pollOptions[1].text}<br/>(vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==2).count()})<br/>
                    <form:radiobutton path="option" name="opt" value="3" checked="${response.pollOption.idx == 3 ? 'checked':''}" style="margin-right: 5px"/>
                    ${poll.pollOptions[2].text}<br/>(vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==3).count()})<br/>
                    <form:radiobutton path="option" name="opt" value="4" checked="${response.pollOption.idx == 4 ? 'checked':''}" style="margin-right: 5px"/>
                    ${poll.pollOptions[3].text}<br/>(vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==4).count()})<br/>
                    <br/>
                    <input type="submit" value="Vote"/>
                </form:form>

                <div class="card mb-4 mt-4">
                    <div class="card-body">
                        <security:authentication var="userid" property="principal.username" />
                        <form action="<c:url value="/poll/${poll.id}/user/${userid}/comment"/>" method="post">
                            <div class="col-12">
                                <input type="text" name="message" required>
                                <input type="submit" value="comment">
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                        <table class="table-responsive">
                            <thead>
                            <tr>
                                <th>Comments</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${messageData}" var="message" varStatus="status">
                                <tr class="py-3">
                                    <td class="col-2">
                                            ${message.regUser.fullName}:
                                    </td>
                                    <td>
                                            ${message.content}
                                    </td>
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
