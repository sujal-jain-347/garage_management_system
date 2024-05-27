<%-- 
    Document   : delevech
    Created on : 16-Apr-2024, 8:23:55 pm
    Author     : SUJAL JAIN
--%>

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
        <h1>dele user</h1>
        
        <sql:setDataSource var="db" driver="org.postgresql.Driver"
                    url="jdbc:postgresql://localhost:5432/world"
                    user="postgres" password="sujal"/>
     
      <sql:update dataSource="${db}">
            DELETE FROM vechicle WHERE id = ?
            <sql:param value="${param.id}" />
        </sql:update>
        
         <%
        response.sendRedirect("adminvech.jsp");
    %>
     
    </body>
</html>
