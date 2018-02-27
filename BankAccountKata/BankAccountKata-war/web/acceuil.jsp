<%-- 
    Document   : acceuil
    Created on : 27 févr. 2018, 00:12:20
    Author     : LENOVO
--%>
<%@include file="entete.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <ul> 
            <li><a href="OperationAction?id=<%=u.getIdUser()%>">WithDrawal or Deposit</a></li>
            <li><a href="AccountsConsultation?id=<%=u.getIdUser()%>">Accounts</a></li>
            <li><a href="AccountAddAction">Add account</a></li>
            <li><a href="UserAddAction">Add user</a></li>
        </ul>
    </body>
</html>
