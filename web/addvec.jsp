<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h1>Vehicle Details</h1>
    <ul>
        <li><b>ID:</b> <%= request.getParameter("id") %></li>
        <li><b>Description:</b> <%= request.getParameter("description") %></li>
        <li><b>Problem:</b> <%= request.getParameter("problem") %></li>
        <li><b>Mechanism:</b> <%= request.getParameter("mech") %></li>
    </ul>
    
     <sql:setDataSource var="db" driver="org.postgresql.Driver"
                    url="jdbc:postgresql://localhost:5432/world"
                    user="postgres" password="sujal"/>
     
        <sql:update dataSource="${db}">
            DELETE FROM vechicle WHERE id = ?
            <sql:param value="${param.id}" />
        </sql:update>
     
     <sql:update dataSource="${db}">
        INSERT INTO vechicle VALUES (?, ?, ?, ? , ?)
        <sql:param value="${param.id}" />
        <sql:param value="${param.description}" />
        <sql:param value="${param.problem}" />
        <sql:param value="${param.mech}" />
        <sql:param value="${param.owner}" />
    </sql:update>
    

    <%
        response.sendRedirect("adminvech.jsp");
    %>
     
     
</body>
</html>
