<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ShopSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>
<main class="container">
    <h1>Welcome to ShopSphere</h1>
    <p><a class="btn" href="${pageContext.request.contextPath}/products">Browse products</a></p>
    <p><a href="${pageContext.request.contextPath}/dbtest">Test database connection</a></p>
</main>
</body>
</html>
