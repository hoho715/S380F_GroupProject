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
</head>
<body>
<a href="<c:url value="/course" />">Return to course list</a><br/>
 <form:form method="POST" modelAttribute="VoteForm">
        <h3>${poll.question}</h3>
     <form:errors path="option" cssClass="error" />
     <form:radiobutton path="option" name="opt" value="1" checked="${response.pollOption.idx == 1 ? 'checked':''}"/>
        ${poll.pollOptions[0].text}/(vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==1).count()})<br/>
     <form:radiobutton path="option" name="opt" value="2" checked="${response.pollOption.idx == 2 ? 'checked':''}"/>
        ${poll.pollOptions[1].text}/(vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==2).count()})<br/>
     <form:radiobutton path="option" name="opt" value="3" checked="${response.pollOption.idx == 3 ? 'checked':''}"/>
         ${poll.pollOptions[2].text}/(vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==3).count()})<br/>
     <form:radiobutton path="option" name="opt" value="4" checked="${response.pollOption.idx == 4 ? 'checked':''}"/>
        ${poll.pollOptions[3].text}/(vote: ${pollResponse.stream().filter(obj->obj.getPollOption().getIdx()==4).count()})<br/>
     <br/><br/>
     <input type="submit" value="Vote"/>
 </form:form>

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
         </tr>
     </c:forEach>
 </table>

</body>
</html>
