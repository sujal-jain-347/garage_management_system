<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Vehicle Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1, h2 {
            color: #333;
        }
        form {
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
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
    if (session.getAttribute("admin") == null) {
        // If "admin" attribute is not set, redirect to index.html
        response.sendRedirect("index.html");
    }
%>

    <div class="container">
        <h1>Vehicle Management</h1>
        
        <h2>Add/Update Vehicle</h2>
        <form action="addvec.jsp" method="post">
            <div>
                <label for="id">ID:</label>
                <input type="text" id="id" name="id" required>
            </div>
            <div>
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="4" required></textarea>
            </div>
            <div>
                <label for="problem">Problem:</label>
                <textarea id="problem" name="problem" rows="4" required></textarea>
            </div>
            <div>
                <label for="mech">Mech:</label>
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
            <div>
                <label for="own">owner name:</label>
                <input type="text" id="own" name="owner" required>
            </div>
            <div>
                <button type="submit">Add / update</button>
            </div>
        </form>
                    
                    <br/>
                    <br/>
        
        <h2>Search Vehicle by ID</h2>
        <form action="searchvech.jsp" method="post">
            <div>
                <label for="id">ID:</label>
                <input type="text" id="id" name="id" required>
            </div>
            <div>
                <button type="submit">Search</button>
            </div>
        </form>
        
        <br/>
        <br/>
        
        <h2>Delete Vehicle by ID</h2>
        <form action="delevech.jsp" method="post">
            <div>
                <label for="id">ID:</label>
                <input type="text" id="id" name="id" required>
            </div>
            <div>
                <button type="submit">delete</button>
            </div>
        </form>
        
        
        <h2>View All Vehicle</h2>
        <form action="all.jsp" method="post">
            <div>
                <button type="submit">View</button>
            </div>
        </form>
        
    </div>
</body>
</html>
