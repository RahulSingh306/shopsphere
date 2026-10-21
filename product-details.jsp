<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><c:out value="${product.name}"/> - ShopSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<main class="container">
    <p><a href="${pageContext.request.contextPath}/products">&larr; Back to products</a></p>

    <div class="details">
        <div class="thumb"></div>
        <div class="info">
            <h1><c:out value="${product.name}"/></h1>
            <p class="brand-name">Brand: <c:out value="${product.brand}"/></p>
            <p><c:out value="${product.description}"/></p>

            <p class="price">
                ₹<fmt:formatNumber value="${product.finalPrice}" minFractionDigits="2" maxFractionDigits="2"/>
                <c:if test="${product.discount > 0}">
                    <span class="old">₹<fmt:formatNumber value="${product.price}" minFractionDigits="2" maxFractionDigits="2"/></span>
                    <span class="badge"><fmt:formatNumber value="${product.discount}" maxFractionDigits="0"/>% off</span>
                </c:if>
            </p>

            <c:choose>
                <c:when test="${product.stock > 0}">
                    <p class="stock ok">In stock (<c:out value="${product.stock}"/> available)</p>
                </c:when>
                <c:otherwise>
                    <p class="stock out">Out of stock</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</main>
</body>
</html>
