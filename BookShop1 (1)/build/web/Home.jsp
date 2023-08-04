
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BookStore</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="icon" type="image/x-icon" href="image/Vẽ tay Hình tròn Logo.jpg">
        <!------ Include the above in your HEAD tag ---------->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

        <style>

            .carousel-inner img {
                width: 100%;
                height: 500px;
                margin-bottom: 10px;
                margin-top: 5px
            }
            .clearfix{
                margin-bottom: 50px;
                margin-top: 50px;
            }
            .pagination {
                float: left;
                margin: 0 0 5px;
            }
            .pagination li a {
                text-decoration: none;
                background-color: #999;
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: white;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: black;
                
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                margin-right: auto;
                float: right;
                margin-top: 10px;
                font-size: 13px;
            }
            a.active{
                color: greenyellow;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <section >

                <div id="demo" class="carousel slide" data-ride="carousel">

                    <!-- Indicators -->
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>

                    </ul>

                    <!-- The slideshow -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="https://intphcm.com/data/upload/poster-quang-cao-nho-gon.jpg" alt="" width="1100" height="500">
                        </div>
                        <div class="carousel-item">
                            <img src="../image/bia.jpg" alt="" width="1100" height="500">
                        </div>
                        <div class="carousel-item">
                            <img src="https://images.fineartamerica.com/images-medium-large-5/greatest-bookshop-in-the-world-garry-walton.jpg" alt="" width="1100" height="500">
                        </div>
                        <div class="carousel-item">
                            <img src="https://www.shutterstock.com/image-vector/set-flyers-bookstore-bookshop-library-600w-1969475506.jpg" alt="" width="1100" height="500">
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                </div>

            </section>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">

                                    <a href="home">Home</a> 
                                </li>
                                <li class="breadcrumb-item"><a href="#">Category</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                <jsp:include page="Left.jsp"></jsp:include>

                    <div class="col-sm-9">
                        <div class="row">

                        <c:forEach items="${ListB}" var="o">

                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top" src="${o.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <h6 class="card-title show_txt"><a href="detail?id=${o.id}" title="View Product">${o.name}</a></h6>
                                        <p class="card-text show_txt">${o.title}
                                        </p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block">${o.price} $</p>
                                            </div>
                                            <div class="col">
                                                <a href="cart?bid=${o.id}" class="btn btn-success btn-block">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>

                    </div>
                </div>

            </div>
            <div class="clearfix">
                <div class="hint-text">Showing <b>9</b> out of <b>${page}</b> entries</div>
                <ul class="pagination">
                    <c:if test="${tag  == 1}">
                        <li class="page-item disabled"><a href="home?index=${tag}" > Previous</a></li>
                    </c:if>
                    <c:if test="${tag  != 1}">
                    <li class="page-item disabled"><a href="home?index=${tag-1}" >Previous</a></li>
                    </c:if>
                        <c:forEach begin="1"  end="${endP}" var="o">
                        <li class="page-item ${tag == o?"active":""} "><a href="home?index=${o}" class="page-link">${o}</a></li>
                        </c:forEach>
                         <c:if test="${tag  == endP}">
                    <li class="page-item"><a href="home?index=${tag}" >Next</a></li> 
                        </c:if>
                        <c:if test="${tag  != endP}">
                        <li class="page-item"><a href="home?index=${tag + 1}" >Next</a></li>
                        </c:if>
                </ul>  
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>

