<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <a href="<c:url value="/course" />" class="btn btn-secondary mb-3">Return to course list</a><br/>
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="tab1-tab" data-bs-toggle="tab" data-bs-target="#tab1" type="button"
                    role="tab" aria-controls="tab1" aria-selected="true">Lecture comment
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="tab2-tab" data-bs-toggle="tab" data-bs-target="#tab2" type="button" role="tab"
                    aria-controls="tab2" aria-selected="false">Poll comment
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="tab3-tab" data-bs-toggle="tab" data-bs-target="#tab3" type="button" role="tab"
                    aria-controls="tab3" aria-selected="false">Vote
            </button>
        </li>
    </ul>

    <div class="tab-content p-3 border border-top-0 rounded-bottom" id="myTabContent">
        <div class="tab-pane fade" id="tab1" role="tabpanel" aria-labelledby="tab1-tab">
            <div class="table-responsive">

                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>User</th>
                        <th>Lecture</th>
                        <th>Action</th>
                        <th class="col-6">Comment</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${lCommentHistory}" var="entry">
                        <tr>
                            <td class="col-1">${entry.user.fullName}</td>
                            <td class="col-1">${entry.lectureName}</td>
                            <td class="col-1">${entry.action}</td>
                            <td class="col-6">${entry.comment}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab2-tab">
            <div class="table-responsive">

                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>User</th>
                        <th>Poll</th>
                        <th>Action</th>
                        <th class="col-6">Comment</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pCommentHistory}" var="entry">
                        <tr>

                            <td class="col-2">${entry.user.fullName}</td>
                            <td class="col-2">${entry.pollQuestion}</td>
                            <td class="col-2">${entry.action}</td>
                            <td class="col-6">${entry.comment}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
        <div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="tab3-tab">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>User</th>
                        <th>Poll</th>
                        <th>Action</th>
                        <th class="col-6">Option</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${voteHistory}" var="entry">
                        <tr>
                            <td class="col-2">${entry.user.fullName}</td>
                            <td class="col-2">${entry.pollQuestion}</td>
                            <td class="col-2">${entry.action}</td>
                            <td class="col-6">${entry.option}</td>
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>