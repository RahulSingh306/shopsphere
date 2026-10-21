<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<header class="topbar">
    <a class="brand" href="${pageContext.request.contextPath}/">ShopSphere</a>
    <nav>
        <a href="${pageContext.request.contextPath}/products">Products</a>
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <c:if test="${sessionScope.user.role == 'ADMIN'}">
                    <a href="${pageContext.request.contextPath}/admin/dashboard">Admin</a>
                </c:if>
                <a href="${pageContext.request.contextPath}/profile">Hi, <c:out value="${sessionScope.user.name}"/></a>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/login">Login</a>
                <a href="${pageContext.request.contextPath}/register">Register</a>
            </c:otherwise>
        </c:choose>
    </nav>
</header>
