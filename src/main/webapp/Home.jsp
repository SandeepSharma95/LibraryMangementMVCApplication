<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <title>Library Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
        }

        .bg {
            /* The image used */
            background-image: url('HomeImage.jpeg'); /* Replace with your background image URL */

            /* Full height */
            height: 100%;

            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.8);
        }

        .navbar-nav .nav-link {
            color: white !important;
        }

        .jumbotron {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 2rem;
        }
    </style>
</head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Add your custom styles or include the styles in an external stylesheet -->
</head>
<body>
<!-- Return result -->
        <c:if test="${result!=null}">
            <p style='background-color:yellow;padding:10px;text-center'> ${result} </p>
            
        </c:if>
    <div class="bg">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="#">Library Management</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/addBook.jsp">Add Book</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/getbooks">View Books</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/AddUser.jsp">Add User</a>
                    </li>  
                     <li class="nav-item">
                        <a class="nav-link" href="/users">All Users</a>
                    </li>  
                </ul>
                      <p class="bg-primary text-white p-2 rounded mt-2"> Welcome: <b>${name}</b> </p>
                
            </div>
        </nav>

        <!-- Jumbotron (Welcome Section) -->
        <div class="container d-flex align-items-center justify-content-center" style="height: 80vh;">
            <div class="jumbotron text-center">
                <h1 class="display-4">Welcome to the Library Management System</h1>
                <p class="lead">Easily manage your library's books, authors, and more!</p>
                <hr class="my-4">
                <p>Get started by exploring the library or adding a new book.</p>
                <a class="btn btn-primary btn-lg" href="/library" role="button">Explore Library</a>
                <a class="btn btn-secondary btn-lg" href="/addBook" role="button">Add New Book</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS CDN -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
