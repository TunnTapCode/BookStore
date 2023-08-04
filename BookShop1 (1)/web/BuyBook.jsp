<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Book</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            .modal-title{
                text-align: center;
                color: black;
            }
            .modal-header{
                background-color: white;
            }
            a btn btn-primary{
                text-align: center;
                margin-left: 300px;
            }
        </style>
    </head>
    <body>

        <div id="editEmployeeModal" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="buy" method="post">
                        <div class="modal-header" >	
                            <h3 class="modal-title">Information Order</h3>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" value="" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input name="email" value="" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input name="address" value="" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input name="phone" value="" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Total Amount</label>
                                <input name="amount" value="${sessionScope.t}" type="text" class="form-control" readonly required>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <a href="cartshow"><button type="button" class="btn btn-primary">Back</button></a>
                            <input type="submit" class="btn btn-info" value="Buy">

                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
