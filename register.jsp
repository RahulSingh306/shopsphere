<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register - ShopSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<main class="container">
    <div class="form-box">
        <h1>Create an account</h1>

        <c:if test="${not empty error}">
            <div class="alert error"><c:out value="${error}"/></div>
        </c:if>

        <form action="${pageContext.request.contextPath}/register" method="post">
            <label for="name">Full name</label>
            <input type="text" id="name" name="name" value="<c:out value='${name}'/>" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<c:out value='${email}'/>" required>

            <label for="mobile">Mobile (optional, 10 digits)</label>
            <input type="text" id="mobile" name="mobile" value="<c:out value='${mobile}'/>">

            <label for="password">Password (at least 6 characters)</label>
            <input type="password" id="password" name="password" required>

            <label for="confirm">Confirm password</label>
            <input type="password" id="confirm" name="confirm" required>

            <button type="submit">Register</button>
        </form>

        <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login</a></p>
    </div>
</main>
</body>
</html>
