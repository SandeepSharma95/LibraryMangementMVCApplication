<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
	<a href="/Home.jsp">Home</a>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Book</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 50px;
            max-width: 600px;
        }

        .form-group label {
            font-weight: bold;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2 class="text-center mb-4">Add New Book</h2>

        <!-- Return result -->
        <c:if test="${res!=null}">
            <p style='background-color:yellow;padding:10px;'> ${res} </p>
        </c:if>

        <!-- Updated form for file upload -->
        <form action="/addbooks" method="post" enctype="multipart/form-data" novalidate>
            <!-- Title Field -->
            <div class="form-group">
                <label for="title">Book Title</label>
                <input type="text" class="form-control" id="title" name="title" placeholder="Enter book title" required>
                <div class="invalid-feedback">
                    Please provide the book title.
                </div>
            </div>

            <!-- Author Field -->
            <div class="form-group">
                <label for="author">Author</label>
                <input type="text" class="form-control" id="author" name="author" placeholder="Enter author name" required>
                <div class="invalid-feedback">
                    Please provide the author's name.
                </div>
            </div>

            <!-- Status Field -->
            <div class="form-group">
                <label for="status">Status</label>
                <select class="form-control" id="status" name="status" required>
                    <option value="">Choose status</option>
                    <option value="Available">Available</option>
                    <option value="Issued">Issued</option>
                </select>
                <div class="invalid-feedback">
                    Please select the book's status.
                </div>
            </div>


            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">Add Book</button>
        </form>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery (only for Bootstrap functionality, no custom JS required) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
