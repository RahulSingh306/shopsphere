<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Products - ShopSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<main class="container">
    <h1>Products</h1>

    <form class="filters" action="${pageContext.request.contextPath}/products" method="get">
        <input type="text" name="q" value="<c:out value='${q}'/>" placeholder="Search products or brands">
        <select name="category">
            <option value="0">All categories</option>
            <c:forEach var="cat" items="${categories}">
                <option value="${cat.categoryId}" ${cat.categoryId == selectedCategory ? 'selected' : ''}>
                    <c:out value="${cat.name}"/>
                </option>
            </c:forEach>
        </select>
        <button type="submit">Search</button>
    </form>

    <c:choose>
        <c:when test="${empty products}">
            <p class="empty">No products found.</p>
        </c:when>
        <c:otherwise>
            <div class="grid">
                <c:forEach var="p" items="${products}">
                    <div class="card">
                        <div class="thumb"></div>
                        <h3><c:out value="${p.name}"/></h3>
                        <p class="brand-name"><c:out value="${p.brand}"/></p>
                        <p class="price">
                            ₹<fmt:formatNumber value="${p.finalPrice}" minFractionDigits="2" maxFractionDigits="2"/>
                            <c:if test="${p.discount > 0}">
                                <span class="old">₹<fmt:formatNumber value="${p.price}" minFractionDigits="2" maxFractionDigits="2"/></span>
                                <span class="badge"><fmt:formatNumber value="${p.discount}" maxFractionDigits="0"/>% off</span>
                            </c:if>
                        </p>
                        <c:choose>
                            <c:when test="${p.stock > 0}"><p class="stock ok">In stock</p></c:when>
                            <c:otherwise><p class="stock out">Out of stock</p></c:otherwise>
                        </c:choose>
                        <a class="btn" href="${pageContext.request.contextPath}/products?id=${p.productId}">View details</a>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</main>
</body>
</html>
