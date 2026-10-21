<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Profile - ShopSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<main class="container">
    <div class="form-box">
        <h1>My Profile</h1>
        <table class="profile-table">
            <tr><th>Name</th><td><c:out value="${sessionScope.user.name}"/></td></tr>
            <tr><th>Email</th><td><c:out value="${sessionScope.user.email}"/></td></tr>
            <tr><th>Mobile</th><td><c:out value="${empty sessionScope.user.mobile ? '-' : sessionScope.user.mobile}"/></td></tr>
            <tr><th>Role</th><td><c:out value="${sessionScope.user.role}"/></td></tr>
        </table>
    </div>
</main>
</body>
</html>
