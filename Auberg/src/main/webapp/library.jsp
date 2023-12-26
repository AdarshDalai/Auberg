<!--library.jsp-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="navbar.jsp" %>

<%@ page import="servlets.LoginServlet" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Auberg - Hostel Provision</title>
      <link rel="stylesheet" href="library.css">
</head>
<body>


    <div class="container my-3">
      <h1>Welcome to My Library</h1>
      <hr />
      <form id="mylibraryform">
        <div class="form-group">
          <label for="exampleInputEmail1">User Name</label>
          <p><%= ((user.User) session.getAttribute("user")).getUsername() %></p>
          <small id="emailHelp" class="form-text text-muted">We'll never share your user name with anyone else.
          </small>
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1">Book Name</label>
          <input type="text" class="form-control" id="Book-Name" />
        </div>
        <div class="form-group">
          <label for="bookType">Book Type</label>
          <div class="check-boxes my-3 mx-5">
            <div class="form-check p-2">
              <input
                class="form-check-input"
                type="radio"
                name="check-box"
                id="Fiction"
                value="Fiction"
              />
              <label class="form-check-label" for="Fiction"> Fiction </label>
            </div>
            <div class="form-check p-2">
              <input
                class="form-check-input"
                type="radio"
                name="check-box"
                id="Programing"
                value="Programing"
              />
              <label class="form-check-label" for="Programing">
                Programing
              </label>
            </div>
            <div class="form-check p-2">
              <input
                class="form-check-input"
                type="radio"
                name="check-box"
                id="Cooking"
                value="Cooking"
              />
              <label class="form-check-label" for="Cooking"> Cooking </label>
            </div>
          </div>
        </div>

        <button type="submit" class="btn btn-outline-dark">Add Book</button>
      </form>
      <table class="table table-dark my-3">
        <thead>
          <tr>
            <th scope="col">Sl No.</th>
            <th scope="col">Date of issue</th>
            <th scope="col">Reader</th>
            <th scope="col">Book Name</th>
            <th scope="col">Genre</th>
            <th scope="col"></th>
          </tr>
        </thead>
        <tbody id="table-body"></tbody>
      </table>
    </div>

<script src="library.js"></script>

</body>
</html>
