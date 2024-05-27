<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Worker Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            text-align: center; /* Center align the content */
        }
        h2 {
            color: #333;
            margin-top: 20px; /* Add some top margin for spacing */
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            width: 300px;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }
        button[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    
 <%
    // Check if the "admin" attribute is not set in the session
    if (session.getAttribute("worker") == null) {
        // If "admin" attribute is not set, redirect to index.html
        response.sendRedirect("index.html");
    }
%>
    <h2>View the Vehicles</h2>
    <form action="viewvech.jsp" method="post">
        <div>
            <label for="mech">Select a Mechanic:</label>
            <select id="mech" name="mech" required>
                <sql:setDataSource var="db" driver="org.postgresql.Driver"
                    url="jdbc:postgresql://localhost:5432/world"
                    user="postgres" password="sujal"/>
                <sql:query dataSource="${db}" var="workers">
                    SELECT * FROM auth
                </sql:query>
                <c:forEach var="worker" items="${workers.rows}">
                    <option value="${worker.name}">${worker.name}</option>
                </c:forEach>
            </select>
        </div>
                <br/>
        <div>
            <button type="submit">View</button>
        </div>
    </form>
    
</body>
</html>
