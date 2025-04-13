<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${courseName}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
<body class="bg-light">
<div class="container mt-4">
    <div class="card shadow">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="display-5 fw-bold text-primary">
                    <i class="bi bi-journal-bookmark"></i> CS Online Course
                </h1>

                <div class="d-flex gap-2">
                    <security:authorize access="!(hasRole('ADMIN') or hasRole('USER'))">
                        <a href="/csCourse/login" class="btn btn-primary">
                            Log in
                        </a>
                    </security:authorize>

                    <security:authorize access="hasRole('ADMIN') or hasRole('USER')">
                        <c:url var="logoutUrl" value="/logout"/>
                        <form action="${logoutUrl}" method="post" class="mb-0">
                            <button type="submit" class="btn btn-danger">
                                Log out
                            </button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>

                    </security:authorize>
                </div>
            </div>

            <security:authorize access="hasRole('ADMIN') or hasRole('USER')">
                <a href="<c:url value="/course/history" />">Comment and vote history</a>
            </security:authorize>
            <security:authorize access="hasRole('ADMIN')">
                <a href="<c:url value="/poll/create" />">Create poll</a><br /><br />
            </security:authorize>

            <div class="d-flex gap-3 mb-4 flex-wrap">
                <security:authorize access="hasRole('ADMIN')">
                    <a href="<c:url value="/user" />" class="btn btn-info">
                        Manage User Accounts
                    </a>
                </security:authorize>

                <security:authorize access="hasRole('ADMIN')">
                    <a href="<c:url value="/course/create" />" class="btn btn-success">
                        Add Lecture
                    </a>
                </security:authorize>

                <security:authorize access="hasRole('USER')">
                    <security:authentication var="userid" property="principal.username" />
                    <a href="<c:url value="/user/update/${userid}" />" class="btn btn-secondary">
                        Manage account
                    </a>
                </security:authorize>
            </div>

            <c:choose>
                <c:when test="${fn:length(lectureData) == 0}">
                    <div class="alert alert-info">
                        There are no lectures available.
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-primary">
                                <tr>
                                    <th>Lecture Name</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${lectureData}" var="entry">
                                <tr>
                                    <td>
                                        <a href="/csCourse/course/lecture/${entry.id}" class="text-decoration-none fw-bold">
                                            ${entry.lectureName}
                                        </a>
                                    </td>

                                    <td class="text-end">
                                        <div class="d-flex gap-2 justify-content-end">
                                            <a href="<c:url value="/course/edit/${entry.id}" />" class="btn btn-sm btn-primary">
                                                Edit
                                            </a>

                                            <security:authorize access="hasRole('ADMIN')">
                                                <a href="<c:url value="/course/delete/${entry.id}" />" class="btn btn-sm btn-danger">
                                                    Delete
                                                </a>
                                            </security:authorize>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<security:authorize access="hasRole('USER')||hasRole('ADMIN')">
    <c:choose>
        <c:when test="${fn:length(pollData) == 0}">
            <i>There are no poll available.</i>
            <br/>
        </c:when>
        <c:otherwise>
            <table border="1">
                <tr>
                    <th>Poll</th>
                </tr>
                <c:forEach items="${pollData}" var="entry">
                    <tr>
                        <td>
                            <security:authorize access="hasRole('USER')">
                                <a href="<c:url value="/poll/vote/${entry.id}" />">${entry.question}</a>
                            </security:authorize>
                            <security:authorize access="hasRole('ADMIN')">
                                <a href="<c:url value="/poll/view/${entry.id}" />">${entry.question}</a>
                            </security:authorize>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</security:authorize>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
