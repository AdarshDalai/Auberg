<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Map" %>

<style>
    nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #333;
        padding: 10px;
        color: white;
    }

    nav ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
    }

    nav ul li {
        margin-right: 20px;
    }

    nav a {
        text-decoration: none;
        color: white;
    }

    .login-button {
        background-color: #4caf50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        text-decoration: none;
    }

    .login-button:hover {
        background-color: #45a049;
    }
</style>

<nav>
    <a href="home.jsp"><img src="your-logo.png" alt="Auberg Logo"></a>

    <ul>
        <li><a href="accomodations.jsp">Accommodation</a></li>
        <li><a href="#food">Food</a></li>
        <li><a href="#library">Library</a></li>
        <li><a href="#transport">Transport</a></li>
    </ul>
    <a href="login.jsp" class="login-button">Login</a>
</nav>
