<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Books</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #007bff;
            padding: 15px;
        }
        .navbar a {
            color: #fff;
            font-size: 18px;
            text-decoration: none;
        }
        .container {
            margin-top: 30px;
        }
        .card {
            border: 1px solid #007bff;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .card-body {
            padding: 20px;
        }
        .card-title {
            font-size: 24px;
            font-weight: bold;
            color: #0056b3;
        }
        .btn-custom {
            background-color: #007bff;
            color: #fff;
            border-radius: 20px;
            padding: 10px 20px;
            text-transform: uppercase;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        .book-image {
            max-height: 200px;
            border-radius: 10px;
            object-fit: cover;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="/Home.jsp">Home</a>
    </nav>
 <!-- Return result -->
        <c:if test="${response!=null}">
            <p style='background-color:yellow;padding:10px;'> ${response} </p>
        </c:if>

    <div class="container">
        <!-- Search Form -->
        <form action="/searchBook" method="get" class="mb-4">
            <div class="form-row">
                <div class="col-md-10">
                    <input type="search" class="form-control" name="title" placeholder="Search by Book Title" required>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-custom btn-block">Search</button>
                </div>
            </div>
        </form>

        <!-- Books List -->
        <h3 class="mb-4">Available Books</h3>

        <div class="row">
            <c:forEach items="${books}" var="b">
                <div class="col-md-4">
                    <div class="card">
                       <!--  --> 
                        <div class="card-body">
                            <h5 class="card-title">${b.title}</h5>
                            <p class="card-text"><strong>Id:</strong> ${b.id}</p>
                            <p class="card-text"><strong>Author:</strong> ${b.author}</p>
                            <p class="card-text"><strong>Status:</strong> ${b.status}</p>

                       <c:if test="${b.status=='Available'}">
                            <form action="/borrow/${b.id}" method="post" class="d-inline">
                                <input type="hidden" name="bookId" value="${b.id}" required />
                                 <input type="text" name="userId" placeholder="Enter user id" required />
                                <button class="btn btn-danger btn-sm">Borrow Book</button>
                                <br>
                            </form>
                            
                       </c:if>
                       
                   <c:if test="${b.status=='Borrowed'}">
                      
                            <form action="/return/${b.id}" method="post" class="d-inline">
                                <input type="hidden" name="bookId" value="${b.id}" required />
                                 <input type="text" name="userId" placeholder="Enter user id" required />
                                <button class="btn btn-danger btn-sm">Return Book</button>
                            </form>
                    </c:if>
                          
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery (only for Bootstrap functionality) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
