<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-success">
    <div class="container">
        <a class="navbar-brand" href="home">BookStores</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto nav-pills nav-fill">
              <c:if test="${sessionScope.acc.role == 1}">
                <li class="nav-item active">
                    <a class="nav-link " href="managerbook">Manager Books</a>
                </li>
                </c:if>

                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Hello ${sessionScope.acc.user} </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item active">
                        <a class="nav-link " href="Login.jsp">Login</a>
                    </li>
                </c:if>
            </ul>

            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-dark btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <c:if test="${sessionScope.cart != null}" >
                    <a class="btn btn-warning btn-sm ml-3" href="cartshow">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i> Cart
                    </a>
                </c:if>
                 <c:if test="${sessionScope.cart == null}" >
                    <a class="btn btn-warning btn-sm ml-3" href="Cart.jsp">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i> Cart
                    </a>
                </c:if>
                    
                
            </form>
        </div>
    </div>
</nav>

<!--end of menu-->
