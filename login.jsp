<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - ShopSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<main class="container">
    <div class="form-box">
        <h1>Login</h1>

        <c:if test="${param.registered == '1'}">
            <div class="alert success">Registration successful. Please log in.</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert error"><c:out value="${error}"/></div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<c:out value='${email}'/>" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>

        <p>New here? <a href="${pageContext.request.contextPath}/register">Create an account</a></p>
    </div>
</main>
</body>
</html>
