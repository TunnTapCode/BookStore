

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">

    <div class="card bg-light mb-1">
        <div class="card-header bg-success text-white text-uppercase"><i class="fa fa-star"></i> New Book</div>
        <div class="card-body">
            <img class="img-fluid" src="${b.image}" />
            <h5 class="card-title">${b.name}</h5>
            <p class="card-text">${b.title}</p>
            <p class="bloc_left_price">${b.price} $</p>
        </div>
    </div>
    <div class="card bg-light mb-10">
        <div class="card-header bg-success text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
        <ul class="list-group category_block">
            <c:forEach items="${ListC}" var="o">
                <li class="list-group-item text-white text-uppercase"><a href="category?cid=${o.cid}">${o.name}</a></li>
                </c:forEach>

        </ul>
    </div>
</div>