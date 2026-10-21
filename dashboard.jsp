<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard - ShopSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<main class="container">
    <h1>Admin Dashboard</h1>
    <p>Welcome, <c:out value="${sessionScope.user.name}"/>. Only users with the ADMIN role can see this page.</p>
    <p><a class="btn" href="${pageContext.request.contextPath}/products">View products</a></p>
</main>
</body>
</html>
