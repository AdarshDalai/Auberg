<!--accomodations.jsp-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
            <%@ include file="navbar.jsp" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Accommodations</title>
        <link rel="stylesheet" href="stylesheet.css">
    </head>

    <body>
<div class="container">
    <div class="accommodations-container">
        <h2>Accommodations</h2>

        <div class="accommodation">
            <h3>Accommodation Title 1</h3>
            <p>Description of the accommodation. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        </div>

        <div class="accommodation">
            <h3>Accommodation Title 2</h3>
            <p>Description of the accommodation. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        </div>

        <!-- Display additional content for logged-in users -->
        <c:if test="${currentSession != null && currentSession.getAttribute('user') != null}">
            <p>Logged in as: ${currentSession.getAttribute('user').getUsername()}</p>
            <!-- Add more content for logged-in users -->
        </c:if>
                            <h2>Accommodations</h2>

                    <div class="accommodation">
                        <h3>Accommodation Title 1</h3>
                        <p>Description of the accommodation. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        </p>
                    </div>

                    <div class="accommodation">
                        <h3>Accommodation Title 2</h3>
                        <p>Description of the accommodation. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        </p>
                    </div>

                </div>
        </div>
    </body>

    </html>