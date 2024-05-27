<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Vehicles</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            text-align: center;
        }
        .vehicle-card {
            background-color: #fff;
            padding: 20px;
            text-align: left;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        h2, h3 {
            color: #333;
            margin-top: 20px;
        }
        .vehicle-info {
            margin-bottom: 5px;
        }
        .horizontal-line {
            border-top: 1px solid #ccc;
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    
    <h1> All Vehicle in the garage</h1>
    
     <%
    // Check if the "admin" attribute is not set in the session
    if (session.getAttribute("admin") == null) {
        // If "admin" attribute is not set, redirect to index.html
        response.sendRedirect("index.html");
    }
%>
    
         

    
    <sql:setDataSource var="db" driver="org.postgresql.Driver"
                url="jdbc:postgresql://localhost:5432/world"
                user="postgres" password="sujal"/>
    
    <sql:query dataSource="${db}" var="vs">
        SELECT * FROM vechicle 
    </sql:query>
        
    <br/>
    <br/>
    
    <c:forEach var="v" items="${vs.rows}">
        <div class="vehicle-card">
            <h3>ID:   
                <span> <c:out value="${v.id}"/> </span>
            </h3>
            
            <h3>Description:
                <span><c:out value="${v.description}"/></span>
            </h3>
            
            <h3 class="vehicle-heading">Problem:
                <span><c:out value="${v.prob}"/></span>
            </h3>
            
            <h3 class="vehicle-heading">mech:
                <span><c:out value="${v.mech}"/></span>
            </h3>
            
             <h3 class="vehicle-heading">owner:
                <span><c:out value="${v.owner_name}"/></span>
            </h3>
            
            
            
            <hr class="horizontal-line"/>
        </div>
    </c:forEach>

</body>
</html>
