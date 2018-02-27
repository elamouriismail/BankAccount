<%-- 
    Document   : accountStatementConsultation
    Created on : 27 févr. 2018, 11:17:48
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@include file="entete.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account statement</title>
    </head>
    <body>
       <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3>Account statement</h3>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="col-md-12">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <td>Date</td>
                                            <td>Type</td> 
                                            <td>Amount</td>    
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="c" items="${operations}">
                                            <tr class="odd gradeX">
                                                <td>${c.dateOperation}</td>
                                                        <td>${c.typeOperation}</td>
                                                              
                                                    <c:set var="d" value="Deposit"/>
                                                     <c:set var="w" value="WithDrawal"/>
                                                <c:choose>                                      
                                                     <c:when test="${c.typeOperation eq d}">
                                                         <td>+${c.amount}</td> 
                                                     </c:when>
                                                     <c:when test="${c.typeOperation eq w}">
                                                         <td>-${c.amount}</td>
                                                     </c:when>
                                                </c:choose>  

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    
                                    

                                </table>
                            </div>
                            <!-- /.table-responsive -->

                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
