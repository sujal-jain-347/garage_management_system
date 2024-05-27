<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            margin-top: 20px;
        }
        .container h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }
        .form-group button[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #ffffff;
            font-size: 16px;
            cursor: pointer;
        }
        .form-group button[type="submit"]:hover {
            background-color: #0056b3;
        }
        .worker-list {
            margin-top: 20px;
        }
        .worker-list h2 {
            margin-bottom: 10px;
            background-color: #007bff;
            color: #ffffff;
            padding: 10px;
            border-radius: 5px;
        }
        .worker-list h2:nth-child(odd) {
            background-color: #0056b3;
        }
        .worker-list h2:last-child {
            margin-bottom: 0;
        }
    </style>
</head>
<body>
    <div class="container">
        
          <%
    // Check if the "admin" attribute is not set in the session
    if (session.getAttribute("admin") == null) {
        // If "admin" attribute is not set, redirect to index.html
        response.sendRedirect("index.html");
    }
%>
        <form action="adminvech.jsp" method="post" class="form-group">
            <button type="submit"> vechicle add/delete </button>
        </form>
        
        <br/>
        <br/>
        <br/>
        
        
        <h2>Add Worker</h2>
        <form action="adduser" method="post" class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">ADD</button>
        </form>
        
        <br/>
        <br/>
        <br/>

        <div class="worker-list">
            <h2>Workers List</h2>
            <sql:setDataSource var="db" driver="org.postgresql.Driver"
                url="jdbc:postgresql://localhost:5432/world"
                user="postgres" password="sujal"/>
            <sql:query dataSource="${db}" var="workers">
                SELECT * FROM auth
            </sql:query>
            <c:forEach var="worker" items="${workers.rows}">
                <h2><c:out value="${worker.name}"/></h2>
            </c:forEach>
        </div>
            
        <br/>
        <br/>
        <br/>

        <h2>Delete Worker</h2>
        <form action="deluser" method="post" class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <button type="submit">DELETE</button>
        </form>
    </div>
</body>
</html>
